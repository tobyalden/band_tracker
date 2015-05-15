require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many(:venues) }
  it { should validate_presence_of(:name) }

  it("Capitalizes the band name before saving.") do
    test_band = Band.create({:name => "boris"})
    expect(test_band.name).to(eq("Boris"))
  end

end
