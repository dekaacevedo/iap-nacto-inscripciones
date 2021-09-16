class Attendant < ApplicationRecord
  belongs_to :event
  has_one :declaration, dependent: :destroy
  has_one_attached :pase

  validates :first_name, :last_name, :pase, presence: true
  validates :rut, presence: true, uniqueness: {scope: :event_id}, format: {with: /\b[0-9|]{7,10}\-[K|k|0-9]/}
  validates :phone, presence: true, format: {with: /[0-9\-\+]{9}/}
  # validates :email, format: { with: /\A[\w|.|-]+@[\w|-]+\.\w+\z/ }

  # def send_info
  #   AttendantMailer.with(user: self).info.deliver_now
  # end
end
