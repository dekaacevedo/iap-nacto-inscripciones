class Event < ApplicationRecord
  belongs_to :user
  has_many :attendants, dependent: :destroy
  has_many :declarations, dependent: :destroy
  has_many :event_collaborators, dependent: :destroy
  has_many :event_attendees, dependent: :destroy
  has_many :collaborators, through: :event_collaborators
  has_many :attendees, through: :event_attendees

  validates :name, :date, :quantity, presence: true
end
