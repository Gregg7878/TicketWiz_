class Event < ApplicationRecord
  belongs_to :organiser
  belongs_to :customer

  # Validations
  validates :title, presence: true
  validates :date, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_in_future

end
