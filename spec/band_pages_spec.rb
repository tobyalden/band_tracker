require('spec_helper')

describe("The path to the home page", {:type => :feature}) do
  it("displays the home page.") do
    visit('/')
    expect(page).to(have_content("Band Tracker"))
  end
end

describe("The path to the bands page", {:type => :feature}) do
  it("displays a list of all the bands in the database.") do
    visit('/')
    click_button('bands')
    expect(page).to(have_content("List of Bands:"))
  end
end

describe("The path to add a band", {:type => :feature}) do
  it("displays a form that adds a band to the database when submitted.") do
    visit('/')
    click_button('bands')
    fill_in('band_name', :with => 'Boris')
    click_button('add_band')
    expect(page).to(have_content("Boris"))
  end
end

describe("The path to a band's page", {:type => :feature}) do
  it("displays a list of all the bands in the database, each of which is a link to that band's page.") do
    test_band = Band.create({:name => "Boris"})
    visit('/')
    click_button('bands')
    click_link(test_band.id)
    expect(page).to(have_content("Boris"))
    expect(page).to(have_no_content("List of Bands:"))
  end
end

describe("The path to update a band's name", {:type => :feature}) do
  it("displays a form on a band's page that updates the band's name when submitted.") do
    test_band = Band.create({:name => "Boris"})
    visit('/')
    click_button('bands')
    click_link(test_band.id)
    fill_in('new_band_name', :with => 'Sun 0)))')
    click_button('update_band_name')
    expect(page).to(have_content('Sun 0)))'))
  end
end

describe("The path to delete a band", {:type => :feature}) do
  it("displays a button on a band's page that deletes the band when pressed.") do
    test_band = Band.create({:name => "Boris"})
    visit('/')
    click_button('bands')
    click_link(test_band.id)
    click_button('delete_band')
    expect(page).to(have_no_content('Boris'))
  end
end

describe("The path to add a venue to a band", {:type => :feature}) do
  it("displays a list of venue checkboxes on a band's page, with a button to add any checked venues to the band.") do
    test_band = Band.create({:name => "Boris"})
    test_venue = Venue.create({:name => "Roseland"})
    test_venue2 = Venue.create({:name => "Wonder ballroom"})
    test_venue3 = Venue.create({:name => "Doug fir lounge"})
    visit('/')
    click_button('bands')
    click_link(test_band.id)
    check(test_venue.id)
    check(test_venue3.id)
    click_button('attach_venues')
    expect(page.html).to(include("<li>Roseland</li>"))
    expect(page.html).not_to(include("<li>Wonder ballroom</li>"))
    expect(page.html).to(include("<li>Doug fir lounge</li>"))
  end
end
