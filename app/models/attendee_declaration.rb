class AttendeeDeclaration < ApplicationRecord
  belongs_to :event_attendee
  belongs_to :event
end
