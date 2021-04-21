require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if !@column_array.nil?
      return @column_array
    else
      query_res = DBConnection.execute2(<<-SQL)
      SELECT 
        *
      FROM
        #{self.table_name}
      SQL
      @column_array = query_res[0].map(&:to_sym)
    end
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        attributes[column]
      end
      define_method(column.to_s + "=") do |val|
        attributes[column] = val 
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    result = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    cols = columns
    results = result.map {|data| Hash[cols.zip(data)]}
    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map{|hsh| self.new(hsh)}
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL,id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?
      LIMIT
        1
    SQL
    result == [] ? nil : self.new(result[0])
  end

  def initialize(params = {})
    params.each do |col,value|
      if self.class.columns.include?(col.to_sym)
        send(col.to_s+"=", value)
      else
        raise "unknown attribute '#{col}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map{|col| send(col) }
  end

  def insert
    attr_values = self.attribute_values
    search_term = "(" + attr_values.map{|_| "?"}.join(",") + ")"
    DBConnection.execute(<<-SQL, *attr_values)
      INSERT INTO
        #{self.class.table_name} (#{self.class.columns.join(",")})
      VALUES
        #{search_term}
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    attr_values = self.attribute_values
    update_term =  self.class.columns.map(&:to_s).zip(attr_values.map{|_| "?"}).map{|pair| pair.join(" = ")}.join(",")
    DBConnection.execute(<<-SQL,*attr_values,self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{update_term}
      WHERE
        id = ?
    SQL
  end

  def save
    if self.class.find(self.id).nil?
      self.insert
    else
      self.update
    end
  end
end