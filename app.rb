require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  new_band = Band.create({:name => params.fetch("band_name")})
  redirect('/bands')
end

get('/band/:id') do
  @band = Band.find(params.fetch('id').to_i())
  @attached_venues = @band.venues
  @unattached_venues = Venue.where.not(id: @band.venue_ids)
  erb(:band)
end

patch('/band/:id') do
  @band = Band.find(params.fetch('id').to_i())
  @band.update(:name => params.fetch('new_band_name'))
  redirect('/band/' + @band.id.to_s())
end

patch('/band/:id/attach_venues') do
  @band = Band.find(params.fetch('id').to_i())
  selected_venues = []
  if(params.has_key?('venue_ids'))
    params.fetch('venue_ids').each() do |venue_id|
      @band.venues.push(Venue.find(venue_id.to_i()))
    end
  end
  redirect('/band/' + @band.id.to_s())
end

delete('/band/:id') do
  @band = Band.find(params.fetch('id').to_i())
  @band.destroy()
  redirect('/bands')
end

get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post('/venues') do
  new_venue = Venue.create({:name => params.fetch("venue_name")})
  redirect('/venues')
end
