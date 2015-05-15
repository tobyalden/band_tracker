require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }
  it { should validate_presence_of(:name) }

  it("Capitalizes the venue name before saving.") do
    test_venue = Venue.create({:name => "roseland"})
    expect(test_venue.name).to(eq("Roseland"))
  end

end
