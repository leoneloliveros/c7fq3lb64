class ExpensesController < ApplicationController
before_action :authenticate_user!, only: [:index]
  def index

     @expenses = current_user.expenses.order("date DESC")

     @expenses = @expenses.select{|x| x[:concept].downcase.gsub("á", "a").include?(params[:concept].downcase.gsub("á", "a"))} if params[:concept].present?
     @expenses = @expenses.select{|x| x[:category_id].to_s.eql?(params[:category_id])} if params[:category_id].present?
  end
end
