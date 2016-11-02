class GraphController < ApplicationController

  def index
    @logs = current_user.logs.order('-date')
    @moods = @logs.map { |l| l.mood }
    @dates = @logs.map { |l| l.date }
    @graph_title = "Mood Over Time"
  end

end
