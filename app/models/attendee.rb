class Attendee < ApplicationRecord
  has_one_attached :pase
  has_many :event_attendee, dependent: :destroy
  has_many :attendee_declarations, through: :event_attendee

  def name
    self.first_name + " " + self.last_name
  end

  validates :first_name, :last_name, presence: true
  validates :rut, presence: true, uniqueness: true, format: {with: /\b[0-9|]{7,10}\-[K|k|0-9]/}
  validates :phone, presence: true, format: {with: /[0-9\-\+]{9}/}
end
