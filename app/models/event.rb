class Event < ApplicationRecord
  belongs_to :organiser
  belongs_to :customer
  has_many :tickets
  has_and_belongs_to_many :categories, join_table: :events_categories


  # Validations
  validates :title, presence: true
  validates :date, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_in_future


  def start_date_in_future
    errors.add(:start_date, "must be in the future") if date.present? && date < Date.today
  end
end
