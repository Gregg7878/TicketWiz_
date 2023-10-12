class CalendarEvent < ApplicationRecord
  belongs_to :event
  belongs_to :organiser
  belongs_to :customer
end
