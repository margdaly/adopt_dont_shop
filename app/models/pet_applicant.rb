class PetApplicant < ApplicationRecord
  belongs_to :applicant
  belongs_to :pet

  validates :pet_status, presence: true
end