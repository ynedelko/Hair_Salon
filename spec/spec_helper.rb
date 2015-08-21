require("rspec")
require("pg")
require("stylist")
require("client")
require("pry")
require("launchy")

DB = PG.connect({:dbname => "hair_salon_test"})
