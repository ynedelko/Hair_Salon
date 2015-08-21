require('spec_helper')

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved stylist") do
      test_client = Client.new({:name => "Cool Joe", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#name") do
    it("lets you return the name of the client") do
      test_client = Client.new({:name => "Cool Sally", :stylist_id => 1, :id => nil})
      expect(test_client.name()).to(eq("Cool Sally"))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist ID out") do
      test_client = Client.new({:name => "Cool Sally", :stylist_id => 1, :id => nil})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same client if they have the same name and list ID") do
      client1 = Client.new({:name => "Cool Sally", :stylist_id => 1, :id => nil})
      client2 = Client.new({:name => "Cool Sally", :stylist_id => 1, :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe(".find") do
    it("returns a client by their ID") do
      test_client1 = Client.new({:name => "Henry", :stylist_id => 1, :id => nil})
      test_client1.save()
      test_client2 = Client.new({:name => "Emma", :stylist_id => 1, :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for a stylist") do
      test_stylist = Stylist.new({:name => "Jane", :id => nil})
      test_stylist.save()
      test_client1 = Client.new({:name => "Frizzy", :stylist_id => test_stylist.id(), :id => nil})
      test_client1.save()
      test_client2 = Client.new({:name => "Hair Ball", :stylist_id => test_stylist.id(), :id => nil})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client1, test_client2]))
    end
  end
end
