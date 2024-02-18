class Slot < ApplicationRecord
  belongs_to :coach
  belongs_to :student, optional: true

  validates :coach, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :note, length: { maximum: 255 }, allow_blank: true
  validates :rate, inclusion: { in: 1..5, allow_nil: true }
end
