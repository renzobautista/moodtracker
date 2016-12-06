class HomeController < ApplicationController
  def index
    if logged_in?
      factors = current_user.factors.where(deleted: false)
      @log = current_user.logs.where(date: Date.today)[0]
      if @log == nil
        @log = Log.new
        for factor in factors
          factor_log = @log.factor_logs.build(factor_id: factor.id)
        end
      end
      @logs = current_user.logs.order('date DESC')
      if @logs.empty?
        @flash = ["You can start by logging a short entry of your day below. We'll assign a mood score for you based on the words you write. To add factors you want to track along with your daily log, click the 'Factors' button above."]
      end
    else
      @user = User.new
    end
  end

end
