require('spec_helper')

describe("The path to the home page", {:type => :feature}) do
  it("displays the home page.") do
    visit('/')
    expect(page).to(have_content("Band Tracker"))
  end
end
