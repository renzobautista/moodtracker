module GraphHelper
  def get_correlation(logs)
    n = logs.count
    if n == 0
      return 0
    end
    if n == 1
      return 0
    end
    average_mood = 0
    average_score = 0
    for log in logs
      average_mood += log[:mood]
      average_score += log[:factor_log].score
    end
    average_mood /= n
    average_score /= n
    stddev_mood = 0
    stddev_score = 0
    for log in logs
      stddev_mood += (log[:mood] - average_mood)**2
      stddev_score += (log[:factor_log].score - average_score)**2
    end
    stddev_mood = Math.sqrt(stddev_mood.to_f/(n - 1))
    stddev_score = Math.sqrt(stddev_score.to_f/(n - 1))
    r = 0
    for log in logs
      r += (log[:mood] - average_mood) * (log[:factor_log].score - average_score)
    end
    r /= stddev_mood * stddev_score * (n - 1)
    r = r**2
  end

  def get_slope(logs)
    n = logs.count
    if n == 0
      return 0
    end
    total_mood = 0
    total_mood_squared = 0
    total_score = 0
    total_moodscore = 0
    for log in logs
      total_mood += log[:mood]
      total_mood_squared += log[:mood]**2
      total_score += log[:factor_log].score
      total_moodscore += log[:mood] * log[:factor_log].score
    end
    a = ((n * total_moodscore - total_mood * total_score).to_f / 
         (n * total_mood_squared - total_mood**2))
  end
end
