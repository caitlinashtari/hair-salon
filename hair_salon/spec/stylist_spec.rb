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

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Sam", :id => nil})
      stylist.save()
      stylist.update({:name => "Samantha"})
      expect(stylist.name()).to(eq("Samantha"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Samantha", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Bob", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Samantha", :id => nil})
      stylist.save()
      client = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => stylist.id})
      client.save()
      client2 = Client.new({:name => "Spam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => stylist.id})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID") do
      test_stylist = Stylist.new({:name => "Candy", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Sandy", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for the selected stylist") do
      stylist = Stylist.new({:name => "Sam", :id => nil})
      stylist.save()
      client = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => stylist.id})
      client.save()
      client2 = Client.new({:name => "Splam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => stylist.id})
      client2.save()
      expect(stylist.clients()).to(eq([client, client2]))
    end
  end

end
