class Admin::SheltersController < ApplicationController

  def index
    @shelters = Shelter.order_by_name_reverse
    @shelters_pending_apps = Shelter.joins(pets: [:pet_applicants])
  end
end