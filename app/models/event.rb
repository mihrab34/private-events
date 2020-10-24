class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :invitations, source: :attendee
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 120 }

  scope :upcoming, -> { where('date >= ?', Time.zone.now) }
  scope :previous, -> { where('date < ?', Time.zone.now) }
end
