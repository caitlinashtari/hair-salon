require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all
  erb(:index)
end

post('/stylists') do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save
  @stylists = Stylist.all
  erb(:index)
end

post('/clients') do
  name = params.fetch("client_name")
  appointment_time = params.fetch("appointment_time")
  stylist_id = params.fetch("stylist_id").to_i
  client = Client.new({:name => name, :id => nil, :appointment_time => appointment_time, :stylist_id => stylist_id})
  client.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  erb(:stylist)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

get('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i())
  stylist_id = @client.stylist_id
  @stylist = Stylist.find(@client.stylist_id)
  erb(:client)
end
