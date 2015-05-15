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
