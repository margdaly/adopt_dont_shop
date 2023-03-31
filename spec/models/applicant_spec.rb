require 'rails_helper'

RSpec.describe Applicant, type: :model do
  describe "relationships" do
    it {should have_many :pet_applicants}
    it {should have_many(:pets).through(:pet_applicants)}
  end
end