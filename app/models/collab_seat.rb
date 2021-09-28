class CollabSeat < ApplicationRecord
  has_many :event_collaborators, dependent: :destroy

  def name
    self.seat
  end
end
