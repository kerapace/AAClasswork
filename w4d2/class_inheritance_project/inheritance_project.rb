class Employee
    attr_reader :name, :title, :salary, :boss,
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = boss
        @boss = boss
    end

    def bonus(multiplier)
        @bonus = self.salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        @employees = []
        super(name, title, salary, boss)
    end

    def bonus(multiplier)
        @bonus = 0
        @employees.each do |emp|
            if emp.is_a?(Manager)
                @bonus += emp.bonus(multiplier)
            else
                @bonus += emp.salary * multiplier
            end
        end
        @bonus
    end
end

ned = Manager.new("Ned","Founder",1000000,nil)
darren = Manager.new("Darren","TA Manager",78000,"Ned")
shawna = Employee.new("Shawna","TA",12000,"Darren")
david = Employee.new("David","TA",10000,"Darren")