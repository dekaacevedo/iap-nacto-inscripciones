class Event < ApplicationRecord
  belongs_to :user
  has_many :attendants, dependent: :destroy
  has_many :declarations, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true
  validates :quantity, presence: true
end
