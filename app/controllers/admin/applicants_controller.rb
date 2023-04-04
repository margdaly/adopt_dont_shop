class Admin::ApplicantsController < ApplicationController
  def show
    @applicant = Applicant.find(params[:id])
    @pets = @applicant.pets
  end

  def update
    @applicant = Applicant.find(params[:id])
    # require 'pry'; binding.pry
    @pet = Pet.find(params[:pet_id])
    if params[:commit] == "Approve #{params[:pet_name]} for Adoption"
      @pet.update({status: "Approved"})
      @pet.save
    end
    redirect_to "/admin/applicants/#{@applicant.id}"
  end
end