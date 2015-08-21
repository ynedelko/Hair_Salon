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

end
