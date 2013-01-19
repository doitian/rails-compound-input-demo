class CompoundDatetime
  def self.from_datetime(datetime)
    new.tap do |result|
      result.datetime = datetime
    end
  end

  attr_accessor :datetime

  # Accepts date and time string. The form just need to submit params
  #
  #   - compound_begining_time(1s) for date
  #   - compound_begining_time(2s) for time
  def initialize(date = nil, time = nil)
    if date.present?
      @datetime = Time.zone.parse([date.presence, time.presence || ''].join(' '))
    end
  end

  def date
    @datetime.strftime('%Y-%m-%d') if @datetime
  end

  def time
    @datetime.strftime('%H:%M') if @datetime
  end
end
