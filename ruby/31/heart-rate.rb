class HeartRate
  def initialize(options={})
    @age                = options[:age]
    @resting_heart_rate = options[:resting_heart_rate]
  end

  def karvonen_heart_rate(intensity)
    ((max_heart_rate - @resting_heart_rate) * intensity/100) + @resting_heart_rate
  end

  def pretty_print
    p 'Intensity | Rate'
    p '----------------'
    (55..95).step(5).each do |intensity|
      p "#{intensity}%       | #{karvonen_heart_rate(intensity)} bpm"
    end
  end

  private
    def max_heart_rate
      220 - @age
    end
end
