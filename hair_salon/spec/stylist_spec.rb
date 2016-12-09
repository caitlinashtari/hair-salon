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

  describe('#save') do
    it('lets you save the stylist to the database') do
      stylist = Stylist.new({:name => "Sam", :id => nil})
      stylist.save
      expect(Stylist.all).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if she/he has the same name") do
      stylist1 = Stylist.new({:name => "Sam", :id => nil})
      stylist2 = Stylist.new({:name => "Sam", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

end
