class Event < ApplicationRecord
  belongs_to :user
  has_many :attendants, dependent: :destroy
end
