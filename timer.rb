class Timer
  @intervals = [];

  def self.set_timeout(callback, seconds)
    end_time = Time.now + seconds

    Thread.new do
      while Time.now <= end_time
        Thread.pass
      end

      callback.()
    end
  end

  def self.set_interval(callback, seconds)
    interval = self.new(callback, seconds)
    interval.set
    @intervals << interval
    @intervals.length - 1
  end

  def self.clear_interval(index)
    @intervals[index].clear
  end

  def self.wait_for_intervals
    Thread.list.drop(1).each(&:join)
  end

  def initialize(callback, seconds)
    @callback, @seconds, @active = callback, seconds, true
  end

  def set
    Thread.new do
      while active
        Timer.set_timeout(callback, seconds).join
      end
    end
  end

  def clear
    @active = false
  end

  private
  attr_reader :callback, :seconds, :active
end
