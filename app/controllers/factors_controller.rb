class FactorsController < ApplicationController

  def index
    @factors = current_user.factors
  end

  def new
  end

  def create
    case params[:name]
    when 'sleep'
      @question = 'How many hours of sleep did you get last night?'
      @yes_no = false
    when 'workout'
      @question = 'Did you work out today?'
      @yes_no = true
    else
      return render 'new'
    end
    if (current_user.factors.map {|c| c.question }).include?(@question)
      @flash = ['You are already tracking that factor.']
      return render 'new'
    end
    @factor = Factor.create(question: @question, yes_no: @yes_no, user_id: current_user.id)
    redirect_to factors_path
  end
end
