require('spec_helper')

describe("The path to the venues page", {:type => :feature}) do
  it("displays a list of all the venues in the database.") do
    visit('/')
    click_button('venues')
    expect(page).to(have_content("List of Venues:"))
  end
end

describe("The path to add a venue", {:type => :feature}) do
  it("displays a form that adds a venue to the database when submitted.") do
    visit('/')
    click_button('venues')
    fill_in('venue_name', :with => 'Roseland')
    click_button('add_venue')
    expect(page).to(have_content("Roseland"))
  end
end
