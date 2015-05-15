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
  @new_band = Band.create({:name => params.fetch("band_name")})
  redirect('/bands')
end

get('/band/:id') do
  @band = Band.find(params.fetch('id').to_i())
  erb(:band)
end

patch('/band/:id') do
  @band = Band.find(params.fetch('id').to_i())
  @band.update(:name => params.fetch('new_band_name'))
  redirect('/band/' + @band.id.to_s())
end
