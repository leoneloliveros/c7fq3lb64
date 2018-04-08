class ExpensesController < ApplicationController
  def index
     @expenses = Expense.order("date DESC")
     @expenses = @expenses.select{|x| x[:concept].downcase.gsub("á", "a").include?(params[:concept].downcase.gsub("á", "a"))} if params[:concept].present?
     @expenses = @expenses.select{|x| x[:category_id].to_s.eql?(params[:category_id])} if params[:category_id].present?
  end
end
