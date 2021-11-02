class EventCollaborator < ApplicationRecord
  belongs_to :event
  belongs_to :collaborator
  has_one :collab_declaration, dependent: :destroy

  def name
    self.collaborator.first_name + " " + self.collaborator.last_name
  end

  validates :collaborator_id, presence: true, uniqueness: {scope: :event_id}
end
