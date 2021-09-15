class Event < ApplicationRecord
  belongs_to :user
  has_many :attendants, dependent: :destroy
  has_many :declarations, dependent: :destroy

  validates :name, :date, :quantity, presence: true
end
