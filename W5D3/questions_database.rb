require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

end

class User
    attr_accessor :f_name, :l_name , :id
    def initialize(options)
        @id = options['id']
        @f_name = options['f_name']
        @l_name = options['l_name']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.f_name, self.l_name)
        INSERT INTO
        users (f_name, l_name)
        VALUES (?,?)
        SQL
    self.id=QuestionsDatabase.instance.last_insert_row_id
    end 

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.f_name, self.l_name,self.id)
        UPDATE
        users
        SET
            f_name = ?, l_name = ?
        WHERE
            id =?
        SQL
    end 

    def self.find_by_id(id)
        QuestionsDatabase.instance.execute 

    end

end

