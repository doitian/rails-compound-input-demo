class Event < ActiveRecord::Base
  attr_accessible :beginning_time, :title
  attr_accessible :compound_beginning_time

  composed_of :compound_beginning_time, {
    :class_name => 'CompoundDatetime',
    :mapping => [ %w(beginning_time datetime) ],
    :converter => Proc.new { |datetime| CompoundDatetime.from_datetime(datetime) }
  }
end
