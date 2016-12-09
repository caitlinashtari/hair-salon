require('spec_helper')

describe(Stylist) do
  describe('#initialize') do
    it('will instantiate a new stylist with name and id attributes') do
      stylist = Stylist.new({:name => "Sam", :id => nil})
      expect(stylist.name).to(eq("Sam"))
      expect(stylist.id).to(eq(nil))
    end
  end
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all).to(eq([]))
    end
  end
end
