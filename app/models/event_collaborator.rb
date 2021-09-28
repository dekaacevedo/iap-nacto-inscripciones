class EventCollaborator < ApplicationRecord
  belongs_to :event
  belongs_to :collab_seat
  belongs_to :collaborator
  has_one :collab_declaration, dependent: :destroy

  validates :collaborator_id, :collab_seat, presence: true, uniqueness: {scope: :event_id}
end
