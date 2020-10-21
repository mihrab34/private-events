class Invitation < ApplicationRecord
  belongs_to :events, class_name: "events", foreign_key: "events_id"
  belongs_to :attendee, class_name: "User", foreign_key: "attendee_id"
end
