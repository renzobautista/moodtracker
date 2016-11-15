class LogsController < ApplicationController
  def create
    is_public = false
    if params[:log][:public] == "1"
      is_public = true
    end
    @log = Log.new(user_id: current_user.id, date: Date.today)
    @log.mood = params[:log][:mood]
    @log.summary = params[:log][:summary]
    @log.public = is_public
    if params[:log][:factor_logs] != nil
      for factor_id, score in params[:log][:factor_logs]
        factor_log = @log.factor_logs.build(factor_id: factor_id)
        factor_log.score = score
        factor_log.save
      end
    end
    @log.save
    redirect_to root_url
  end

  def update
    is_public = false
    if params[:log][:public] == "1"
      is_public = true
    end
    @log = current_user.logs.where(date: Date.today)[0]
    @log.mood = params[:log][:mood]
    @log.summary = params[:log][:summary]
    @log.public = is_public
    if params[:log][:factor_logs] != nil
      for factor_id, score in params[:log][:factor_logs]
        factor_log = @log.factor_logs.where(factor_id: factor_id)[0]
        if factor_log == nil
          factor_log = @log.factor_logs.build(factor_id: factor_id)
        end
        factor_log.score = score
        factor_log.save
      end
    end
    @log.save
    redirect_to root_url
  end

  def browse
    @logs = Log.where(public: true).order('date DESC')
  end
end
