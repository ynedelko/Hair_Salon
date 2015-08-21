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
    it("returns a stulist by their ID") do
      test_stylist1 = Stylist.new({:name => "Sam", :id => nil})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:name => "Sue", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end


end
