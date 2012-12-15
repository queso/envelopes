require 'spec_helper'

describe Expense do
  
  describe "#occurs?" do
    before do
      @expense = Expense.create(:day_of_month => 3, :start_date => "2012-11-30")
    end
    it "should return true if an expense occurs between start and end date" do
      start_date = Time.parse('2012-12-01')
      end_date = Time.parse('2012-12-04')
      @expense.occurs?(start_date, end_date).should be_true
    end

    it "should return false if an expense does not occur between start and end date" do
      start_date = Time.parse('2012-12-05')
      end_date = Time.parse('2012-12-09')
      @expense.occurs?(start_date, end_date).should be_false
    end
  end

  describe "#find_expenses_between" do
    before do
      @expense = Expense.create(:day_of_month => 2, :start_date => "2012-11-30")
      @expense2 = Expense.create(:day_of_month => 3, :start_date => "2012-11-30")
      @expense3 = Expense.create(:day_of_month => 10, :start_date => "2012-11-30")
      @expense3 = Expense.create(:day_of_month => 18, :start_date => "2012-11-30")
    end

    it "should return an array of expenses that occur between start and end date" do
      start_date = Time.parse('2012-12-01')
      end_date = Time.parse('2012-12-04')
      expenses = Expense.find_expenses_between(start_date, end_date)
      expenses.size.should == 2
    end
    
    it "should return an array of expenses and take into account lead time on bills" do
      start_date = Time.parse('2012-12-05')
      end_date = Time.parse('2012-12-06')
      expenses = Expense.find_expenses_between(start_date, end_date)
      expenses.size.should == 1
    end

  end
end
