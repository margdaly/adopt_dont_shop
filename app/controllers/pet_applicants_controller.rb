class PetApplicantsController < ApplicationController
  def create
    pet_applicant = PetApplicant.create(pet_applicant_params)
    applicant = pet_applicant.applicant
    redirect_to "/applicants/#{pet_applicant.applicant_id}"
  end

  def update
    pet_applicant = PetApplicant.find(params[:id])
    pet_applicant.update(pet_applicant_params)
    applicant = pet_applicant.applicant
    redirect_to "/admin/applicants/#{applicant.id}"
  end

  private
  def pet_applicant_params
    params.require(:pet_applicant).permit(:applicant_id, :pet_id, :pet_status)
  end
end
