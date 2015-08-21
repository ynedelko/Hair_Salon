require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts of with no stylists") do
    expect(Stylist.all()).to(eq([]))
  end
end

  describe("#name") do
    it("it tells you the name of the stylist") do
      stylist = Stylist.new({:name => "Lulu", :id => nil})
      expect(stylist.name()).to(eq("Lulu"))
    end
  end

  describe("#id") do
    it("sets the stylist ID when you save it") do
      stylist = Stylist.new({:name => "Lulu", :id =>nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save the stylists to the database") do
      stylist = Stylist.new({:name => "Larry", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if they have the same name") do
      stylist1 = Stylist.new({:name => "Lou", :id => nil})
      stylist2 = Stylist.new({:name => "Lou", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns a stylist by their ID") do
      test_stylist1 = Stylist.new({:name => "Sam", :id => nil})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:name => "Sue", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
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

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Jon", :id => nil})
      stylist.save()
      stylist.update({:name => "Jane"})
      expect(stylist.name()).to(eq("Jane"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist1 = Stylist.new({:name => "Good Stylist", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:name => "Bad Stylist", :id => nil})
      stylist2.save()
      stylist2.delete()
      expect(Stylist.all()).to(eq([stylist1]))
    end
  end
end
