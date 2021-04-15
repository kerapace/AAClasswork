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
            id = ?
        SQL
    end 

    def self.find_by_id(id)
        raise "invalid id" if id < 1
        query_result = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL
        query_result.map {|user| User.new(user)}[0]
    end

    def self.find_by_name(f_name,l_name)
        query_result = QuestionsDatabase.instance.execute(<<-SQL,f_name, l_name)
        SELECT
            *
        FROM
            users
        WHERE
            f_name = ? AND l_name = ?
        SQL
        query_result.map {|user| User.new(user)}
    end

    def average_karma
        query_result = QuestionsDatabase.instance.execute(<<-SQL,self.id)
        SELECT
            count(*)
        FROM
            (SELECT 
                *
            FROM
              question_likes
            WHERE
                u_id = self.id
            ) AS users_likes
        GROUP BY 
                q_id
        SQL  
    end 
end

class Question
    attr_accessor :id, :title, :body, :u_id
    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @u_id = options['u_id']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.u_id)
        INSERT INTO
        questions (title, body, u_id)
        VALUES (?, ?, ?)
        SQL
        self.id=QuestionsDatabase.instance.last_insert_row_id
    end 

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body ,self.u_id)
        UPDATE
            questions
        SET
            title = ?, body = ?, u_id = ? 
        WHERE
            id = ?
        SQL
    end 

    def self.find_by_id(id)
        raise "invalid id" if id < 1
        query_result = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        query_result.map {|q| Question.new(q)}[0]
    end

    def self.find_by_title(title)
        query_result = QuestionsDatabase.instance.execute(<<-SQL,title)
        SELECT
            *
        FROM
            questions
        WHERE
            title
        SQL
        query_result.map {|q| Question.new(q)}
    end
end

class Reply
    attr_accessor :id, :q_id, :p_reply_id, :body
    def initialize(options)
        @id = options['id']
        @q_id = options['q_id']
        @p_reply_id = options['p_reply_id']
        @body = options['body']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.q_id, self.p_reply_id, self.body)
        INSERT INTO
        replies (q_id, p_reply_id, body)
        VALUES (?, ?, ?)
        SQL
        self.id=QuestionsDatabase.instance.last_insert_row_id
    end 

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.q_id, self.p_reply_id, self.body)
        UPDATE
            replies
        SET
            q_id = ?, p_reply_id = ?, body = ? 
        WHERE
            id = ?
        SQL
    end 

    def self.find_by_id(id)
        raise "invalid id" if id < 1
        query_result = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        query_result.map {|r| Reply.new(r)}[0]
    end

    def self.find_all_replies(q_id)
        query_result = QuestionsDatabase.instance.execute(<<-SQL,q_id)
        SELECT
            *
        FROM
            replies
        WHERE
            q_id = ?
        SQL
        query_result.map {|r| Reply.new(r)}
    end
end

class QuestionFollow

    attr_accessor :id, :u_id, :q_id
    def initialize(options)
        @id = options['id']
        @q_id = options['q_id']
        @u_id = options['u_id']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.q_id, self.u_id)
        INSERT INTO
        question_follows(q_id,u_id)
        VALUES (?, ?)
        SQL
        self.id=QuestionsDatabase.instance.last_insert_row_id
    end 

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.q_id, self.u_id)
        UPDATE
            question_follows
        SET
            q_id = ?, u_id = ?
        WHERE
            id = ?
        SQL
    end 

    def self.find_by_id(id)
        raise "invalid id" if id < 1
        query_result = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            question_follows
        WHERE
            id = ?
        SQL
        query_result.map {|qf| QuestionFollow.new(qf)}[0]
    end

    def self.followers_for_question_id(q_id)
        query_result = QuestionsDatabase.instance.execute(<<-SQL,q_id)
        SELECT
           users.id, users.f_name, users.l_name
        FROM
            question_follows
        JOIN
            users ON question_follows.u_id = users.id
        WHERE
            q_id = ?
        SQL
        query_result.map {|r| User.new(r)}
    end

    def self.most_followed_question(n = 1)
        query_result = QuestionsDatabase.instance.execute(<<-SQL,n)
        SELECT
            questions.id, questions.title, questions.body, questions.u_id
        FROM
            questions
        JOIN question_follows ON questions.id = question_follows.q_id
        GROUP BY questions.id
        ORDER BY COUNT(*) DESC
        LIMIT ?
        SQL
        query_result.map {|r| Question.new(r)}
    end

end

class QuestionLike
  attr_accessor :id, :u_id, :q_id
    def initialize(options)
        @id = options['id']
        @q_id = options['q_id']
        @u_id = options['u_id']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.q_id, self.u_id)
        INSERT INTO
        question_follows(q_id,u_id)
        VALUES (?, ?)
        SQL
        self.id=QuestionsDatabase.instance.last_insert_row_id
    end 

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.q_id, self.u_id)
        UPDATE
            question_follows
        SET
            q_id = ?, u_id = ?
        WHERE
            id = ?
        SQL
    end 

    def self.find_by_id(id)
        raise "invalid id" if id < 1
        query_result = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            question_follows
        WHERE
            id = ?
        SQL
        query_result.map {|qf| QuestionLike.new(qf)}[0]
    end
    
end