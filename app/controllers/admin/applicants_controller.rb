class Admin::ApplicantsController < ApplicationController
  def show
    @applicant = Applicant.find(params[:id])
    @pets = @applicant.pets
  end
end
