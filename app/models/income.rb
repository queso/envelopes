class Income < ActiveRecord::Base
  def next_pay_dates(number, start_date)
    schedule = IceCube::Schedule.new(self.start_date.to_time)
    rule = IceCube::Rule.weekly(self.every_x_weeks)
    schedule.add_recurrence_rule rule
    schedule.next_occurrences(8, start_date)
  end

end
