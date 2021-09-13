class Declaration < ApplicationRecord
  belongs_to :event
  belongs_to :attendant
end
