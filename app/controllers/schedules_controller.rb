class SchedulesController < ApplicationController
  def show
    from_date = Time.now - 2.weeks
    @income = Income.first
    @pay_dates = @income.next_pay_dates(8, from_date)
    @bills = Hash.new
    @pay_dates.each_with_index do |pay_date, index|
      end_date = @pay_dates[index + 1]
      end_date ||= @pay_dates[index]
      @bills[pay_date] = Expense.find_expenses_between(pay_date, end_date - 1.day) 
    end
    @totals = Hash.new
    @pay_dates.each do |pay_date|
      @totals[pay_date] = @bills[pay_date].collect {|e| e.amount}.reduce(:+)
    end
  end
end
