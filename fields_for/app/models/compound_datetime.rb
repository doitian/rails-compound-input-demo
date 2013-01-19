class CompoundDatetime
  attr_accessor :datetime

  def initialize(datetime)
    @datetime = datetime
  end

  # accepts hash like:
  #
  #     {
  #       'date' => '2012-12-20',
  #       'time' => '20:30'
  #     }
  def assign_attributes(hash)
    if hash[:date].present?
      @datetime = Time.zone.parse([hash[:date].presence, hash[:time].presence || ''].join(' '))
    end
    self
  end

  def date
    @datetime.strftime('%Y-%m-%d') if @datetime
  end

  def time
    @datetime.strftime('%H:%M') if @datetime
  end

  def persisted?; false; end
end
