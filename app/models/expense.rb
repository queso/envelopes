class Expense < ActiveRecord::Base
  def self.find_expenses_between(start_date, end_date = Time.now)
    expenses = Expense.all.order(:day_of_month => :asc).select {|e| e.occurs?(start_date, end_date)}
    expenses
  end

  def occurs?(start_date, end_date)
    schedule = IceCube::Schedule.new(self.start_date.to_time)
    rule = IceCube::Rule.monthly.day_of_month(self.day)
    schedule.add_recurrence_rule rule
    schedule.occurs_between?(start_date, end_date)
  end

  def day
    return self.day_of_month if self.day_of_month < 4
    self.day_of_month - 4 
  end
end
