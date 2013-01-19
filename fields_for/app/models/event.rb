class Event < ActiveRecord::Base
  attr_accessible :beginning_time, :title

  attr_accessible :compound_beginning_time_attributes

  def compound_beginning_time
    CompoundDatetime.new(beginning_time)
  end

  def compound_beginning_time_attributes=(attributes)
    self.beginning_time = compound_beginning_time.assign_attributes(attributes).datetime
  end
end
