class FactorsController < ApplicationController

  def index
    @factors = current_user.factors.where(deleted: false)
  end

  def new
    @factor = Factor.new
  end

  def create
    if params[:custom]
      question = params[:factor]
      is_yes_no = true
      if params[:factor_type] == 'Numeric'
        is_yes_no = false
      end
      if (current_user.factors.where(deleted: false).map {|c| c.question }).include?(question)
        @flash = ['You are already tracking that factor.']
        return render 'new'
      end
      @factor = Factor.create(question: question, yes_no: is_yes_no, user_id: current_user.id, deleted: false)
    else
      case params[:name]
      when 'sleep'
        @question = 'Hours of sleep'
        @yes_no = false
      when 'workout'
        @question = 'Worked out'
        @yes_no = true
      else
        return render 'new'
      end
      if (current_user.factors.where(deleted: false).map {|c| c.question }).include?(@question)
        @flash = ['You are already tracking that factor.']
        return render 'new'
      end
      @factor = Factor.create(question: @question, yes_no: @yes_no, user_id: current_user.id, deleted: false)
    end
    redirect_to factors_path
  end

  def destroy
    @factor = Factor.find(params[:id])
    @factor.update_attributes(deleted: true)
    redirect_to factors_path
  end
end
