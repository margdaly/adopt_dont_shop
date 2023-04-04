class Applicant < ApplicationRecord
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  has_many :pet_applicants, dependent: :destroy
  has_many :pets, through: :pet_applicants

  def pet_app_find(pet_id)
    pet_applicants.where(pet_id: pet_id).first
  end
end