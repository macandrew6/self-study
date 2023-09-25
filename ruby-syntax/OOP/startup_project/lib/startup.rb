require "employee"

class Startup
  attr_accessor :name, :funding, :salaries
  attr_reader :employees
  def initialize (name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title? (title)
    @salaries.has_key?(title)
  end

  def > (startup)
    self.funding > startup.funding
  end

  def hire (employee_name, title)
    if self.valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "title is invalid"
    end
  end

  def size
    @employees.length
  end

  def pay_employee (employee_inst)
    loot = @salaries[employee_inst.title]
    if self.funding >= loot
      employee_inst.pay(loot)
      self.funding -= loot
    else
      raise 'we dont have your money'
    end
  end

  def payday
    @employees.each do |employee|
      self.pay_employee(employee)
    end
  end

  def average_salary
    salary_sum = 0
    @employees.each do |employee|
      salary_sum += @salaries[employee.title]
    end

    return salary_sum / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire (other_startup)
    self.funding += other_startup.funding
    other_startup.salaries.each do |title, salary|
      if !@salaries[title]
        @salaries[title] = salary
      end
    end

    other_startup.employees.each do |employee|
      @employees << employee
    end

    other_startup.close
  end
end
