class EventAttendee < ApplicationRecord
  belongs_to :event
  belongs_to :attendee
  has_one :attendee_declaration, dependent: :destroy

  def name
    self.attendee.first_name + " " + self.attendee.last_name
  end

  validates :attendee_id, presence: true, uniqueness: {scope: :event_id}
end
