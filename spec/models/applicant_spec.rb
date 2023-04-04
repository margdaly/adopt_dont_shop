require 'rails_helper'

RSpec.describe Applicant, type: :model do
  describe "relationships" do
    it {should have_many :pet_applicants}
    it {should have_many(:pets).through(:pet_applicants)}
  end
  
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:street)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
  end

  describe "instance methods" do
    before :each do
      @mystery_bldg = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
      @boulder = Shelter.create(name: 'Boulder shelter', city: 'Boulder, CO', foster_program: false, rank: 9)
  
      @lobster = @mystery_bldg.pets.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster')
      @sylvester = @boulder.pets.create!(adoptable: true, age: 1, breed: 'domestic shorthair', name: 'Sylvester')
      @lucille_bald = @mystery_bldg.pets.create!(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
      @scooby = @mystery_bldg.pets.create!(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true)
  
      @thomas = Applicant.create!(name: "Thomas", street: "1515 15 Ave", city: "Denver", state: "CO", zip: "80203", good_home: "Lots of love and land!", status: "Pending")
      PetApplicant.create!(applicant: @thomas, pet: @lobster)
      
      @sasha = Applicant.create!(name: "Sasha Baron", street: "10 Maple Way", city: "Eagleton", state: "CO", zip: "80223", good_home: "Cat Whisperer", status: "Pending")
      @application_3 = PetApplicant.create!(applicant: @sasha, pet: @lucille_bald)
      @application_4 = PetApplicant.create!(applicant: @sasha, pet: @sylvester)
      
      @danny = Applicant.create!(name: "Danny Lowe", street: "640 Center St.", city: "Plymouth", state: "CO", zip: "80101", good_home: "Energetic and exercise lover", status: "Pending")
      @application_1 = PetApplicant.create!(applicant: @danny, pet: @lobster)
      @application_2 = PetApplicant.create!(applicant: @danny, pet: @scooby)
    end
    
    describe '#pet_app_status' do
      it "matches pet application with a specific pet id and applicant id" do
        expect(@danny.pet_app_find("#{@scooby.id}")).to eq(@application_2)
        expect(@danny.pet_app_find("#{@lobster.id}")).to eq(@application_1)
        expect(@sasha.pet_app_find("#{@sylvester.id}")).to eq(@application_4)
        expect(@sasha.pet_app_find("#{@lucille_bald.id}")).to eq(@application_3)
      end 
    end
  end
end
