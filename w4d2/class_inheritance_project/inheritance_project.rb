class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(nickname, titular, salari, bossy)
        @name = nickname
        @title = titular
        @salary = salari
        @boss = bossy
    end

    def bonus(multiplier)
        @bonus = self.salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def bonus(multiplier)
        @bonus = 0
        @employees.each do |emp|
            @bonus += emp.salary * multiplier
            if emp.is_a?(Manager)
                @bonus += emp.bonus(multiplier)
            end
        end
        @bonus
    end
end

shawna = Employee.new("Shawna","TA",12000,"Darren")
david = Employee.new("David","TA",10000,"Darren")
ned = Manager.new("Ned","Founder",1000000,nil)
darren = Manager.new("Darren","TA Manager",78000,"Ned")

ned.employees << darren
darren.employees << shawna << david

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000