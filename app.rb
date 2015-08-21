require ('sinatra')
require ('sinatra/reloader')
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end
