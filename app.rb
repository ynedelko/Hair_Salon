require ('sinatra')
require ('sinatra/reloader')
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

#shows welcome page
get('/') do
  erb(:index)
end

#shows list of stylists
get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

#shows form to get info to create a new stylist
get("/stylists/new") do
  erb(:stylist_form)
end

#creates a new stylist from the info gathered in the form
post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)
end

#shows details about a specific stylist
get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

#show form to get info for editing a stylist
get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

#update a stylist
patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

#delete a stylist
delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

#see all clients
get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

#shows form to get info to create a new client
get("/clients/new") do
  erb(:client_form)
end

#adds a client
post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id).to_i()
  @client = Client.new({:name => name, :stylist_id => stylist_id, :id => nil})
  @client.save()
  erb(:success)
end
