class HomeController < ApplicationController
  def index
    if logged_in?
      factors = current_user.factors
      @log = current_user.logs.where(date: Date.today)[0]
      if @log == nil
        @log = Log.new
        for factor in factors
          factor_log = @log.factor_logs.build(factor_id: factor.id)
        end
      end
      @logs = current_user.logs.order('-date')
    else
      @user = User.new
    end
  end

end
