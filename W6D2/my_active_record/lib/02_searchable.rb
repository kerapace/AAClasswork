require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_string = params.map{|k,v| [k.to_s, "'#{v}'"]}.map{|pair| pair.join(" = ")}.join(" AND ")
    result = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_string}
    SQL
    result.map{|hsh| self.new(hsh)}
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
