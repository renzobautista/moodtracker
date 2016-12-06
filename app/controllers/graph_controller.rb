class GraphController < ApplicationController
  include GraphHelper

  def index
    @factors = current_user.factors.where(deleted: false)
    @logs = current_user.logs.order('date')
    @graph_title = "Mood Over Time"
    @is_dual = false
    if params[:factor_id]
      @logs = @logs.map { |l| { mood: l.mood, date: l.date, factor_log: l.factor_logs.where(factor_id: params[:factor_id])[0] } }
      @logs = @logs.select {|l| l[:factor_log] != nil }
      @correlation = get_correlation(@logs)
      @slope = (get_slope(@logs) * 100).round / 100.0
      @graph_title = "Mood and " + Factor.find(params[:factor_id]).question.titleize + " Over Time"
      @is_dual = true
    end
  end

end
