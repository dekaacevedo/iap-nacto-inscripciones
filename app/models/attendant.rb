class Attendant < ApplicationRecord
  belongs_to :event

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :rut, presence: true, uniqueness: {scope: :event_id}, format: {with: /\b[0-9|]{7,10}\-[K|k|0-9]/}
  validates :phone, presence: true
  validates :email, format: { with: /\A[\w|.|-]+@[\w|-]+\.\w+\z/ }
end
