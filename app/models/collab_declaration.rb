class CollabDeclaration < ApplicationRecord
  belongs_to :event
  belongs_to :event_collaborator
end
