class EventCollaborator < ApplicationRecord
  belongs_to :event
  belongs_to :collaborator
  has_one :collab_declaration, dependent: :destroy

  validates :collaborator_id, presence: true, uniqueness: {scope: :event_id}
end
