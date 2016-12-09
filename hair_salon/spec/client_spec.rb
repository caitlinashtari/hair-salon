require('spec_helper')

describe(Client) do
  describe('#initialize') do
    it('will instantiate a new client with name and id attributes') do
      client = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => 1})
      expect(client.name).to(eq("Blam"))
      expect(client.appointment_time).to(eq("2016-12-12 00:12:00"))
      expect(client.stylist_id).to(eq(1))
    end
  end

  describe('.all') do
    it('starts off with no clients') do
      expect(Client.all).to(eq([]))
    end
  end

  describe('#save') do
    it('lets you save the client to the database') do
      client = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => 1})
      client.save
      expect(Client.all).to(eq([client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name, ID, and stylist ID") do
      client1 = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => 1})
      client2 = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      client1 = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => 1})
      client1.save
      client2 = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => 1})
      client2.save
      client1.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end

end
