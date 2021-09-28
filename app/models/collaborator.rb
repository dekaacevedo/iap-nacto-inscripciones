class Collaborator < ApplicationRecord
  has_one_attached :pase
  has_many :event_collaborators, dependent: :destroy
  has_many :collab_declarations, through: :event_collaborators

  def name
    self.first_name + " " + self.last_name
  end

  validates :first_name, :last_name, :pase, presence: true
  validates :rut, presence: true, uniqueness: true, format: {with: /\b[0-9|]{7,10}\-[K|k|0-9]/}
  validates :phone, presence: true, format: {with: /[0-9\-\+]{9}/}
end
