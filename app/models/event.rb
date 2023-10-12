class Event < ApplicationRecord
  belongs_to :organiser
  belongs_to :customer
end
