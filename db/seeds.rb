

PetApplicant.delete_all
Pet.delete_all  
Shelter.delete_all
Applicant.delete_all
##SHELTERS
    @aurora = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @mystery_bldg = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    @boulder = Shelter.create(name: 'Boulder shelter', city: 'Boulder, CO', foster_program: false, rank: 9)
    
    @rgv = Shelter.create!(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @fancy_colordo = Shelter.create!(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

 ##PETS   
    
    @mr_pirate = @aurora.pets.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @clawdia = @aurora.pets.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @ann = @aurora.pets.create!(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)

    @lobster = @mystery_bldg.pets.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster')
    @lucille_bald = @mystery_bldg.pets.create!(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    @scooby = @mystery_bldg.pets.create!(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true)
    
    @sylvester = @boulder.pets.create!(adoptable: true, age: 1, breed: 'domestic shorthair', name: 'Sylvester')
    @lasagna = @boulder.pets.create!(adoptable: true, age: 1, breed: 'orange tabby shorthair', name: 'Lasagna')
    
## APPLICANTS    
    @heather = Applicant.create!(name: "Heather Moore", street: "Pearl St", city: "Denver", state: "CO", zip: "80210")

    # @olivia = Applicant.create!(name: "Olivia Valentin", street: "1234 Main St", city: "Denver", state: "CO", zip: "80203",  good_home: "Lots of love and land!", status: "Pending")
    # PetApplicant.create!(applicant: @olivia, pet: @lucille_bald)
    # PetApplicant.create!(applicant: @olivia, pet: @lobster)

    # @thomas = Applicant.create!(name: "Thomas", street: "1515 15 Ave", city: "Denver", state: "CO", zip: "80203", good_home: "Lots of love and land!", status: "Pending")
    # PetApplicant.create!(applicant: @thomas, pet: @lobster)
    
    # @sasha = Applicant.create!(name: "Sasha Baron", street: "10 Maple Way", city: "Eagleton", state: "CO", zip: "80223", good_home: "Cat Whisperer", status: "Pending")
    # PetApplicant.create!(applicant: @sasha, pet: @lucille_bald)
    # PetApplicant.create!(applicant: @sasha, pet: @sylvester)
    
    # @danny = Applicant.create!(name: "Danny Lowe", street: "640 Center St.", city: "Plymouth", state: "CO", zip: "80101", good_home: "Energetic and exercise lover", status: "Pending")
    # PetApplicant.create!(applicant: @danny, pet: @lobster)
    # PetApplicant.create!(applicant: @danny, pet: @scooby)