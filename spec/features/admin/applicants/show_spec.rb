require 'rails_helper'

RSpec.describe "Admin Applicants Show" do
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
    PetApplicant.create!(applicant: @sasha, pet: @lucille_bald)
    PetApplicant.create!(applicant: @sasha, pet: @sylvester)
    
    @danny = Applicant.create!(name: "Danny Lowe", street: "640 Center St.", city: "Plymouth", state: "CO", zip: "80101", good_home: "Energetic and exercise lover", status: "Pending")
    PetApplicant.create!(applicant: @danny, pet: @lobster)
    PetApplicant.create!(applicant: @danny, pet: @scooby)
  end

  describe "approving a pet for adoption" do
    it "displays all pets on that  application" do
      visit "/admin/applicants/#{@danny.id}"

      expect(page).to have_content(@lobster.name)
      expect(page).to have_content(@scooby.name)
      expect(page).to_not have_content(@lucille_bald.name)
      expect(page).to_not have_content(@sylvester.name)
    end

    it 'has a button to approve the pet for adoption' do
      visit "/admin/applicants/#{@danny.id}"

      # save_and_open_page
      expect(page).to have_button("Approve #{@scooby.name} for Adoption")
      expect(page).to have_button("Approve #{@lobster.name} for Adoption")
      expect(page).to_not have_button("Approve #{@lucille_bald.name} for Adoption")
      expect(page).to_not have_button("Approve #{@sylvester.name} for Adoption")
      click_on "Approve #{@lobster.name} for Adoption"

      expect(current_path).to eq("/admin/applicants/#{@danny.id}")
 
      expect(page).to have_content("#{@lobster.name} is approved for adoption!")
      expect(page).to_not have_button("Approve #{@lobster.name} for Adoption")
      expect(page).to have_button("Approve #{@scooby.name} for Adoption")
    end
    it 'has a button to reject the pet for adoption' do
      visit "/admin/applicants/#{@sasha.id}"
      # save_and_open_page
      expect(page).to have_button("Reject #{@lucille_bald.name} for Adoption")
      expect(page).to have_button("Reject #{@sylvester.name} for Adoption")
      expect(page).to_not have_button("Reject #{@scooby.name} for Adoption")
      expect(page).to_not have_button("Reject #{@lobster.name} for Adoption")
      
      click_on "Reject #{@lucille_bald.name} for Adoption"

      expect(current_path).to eq("/admin/applicants/#{@sasha.id}")
      expect(page).to have_content("#{@lucille_bald.name} is rejected for adoption.")
      expect(page).to_not have_button("Reject #{@lucille_bald.name} for adoption")
      expect(page).to_not have_content("#{@sylvester.name} is rejected for adoption.")
      save_and_open_page
    end
  end
end