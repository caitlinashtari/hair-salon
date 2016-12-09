require('spec_helper')

describe(Client) do
  describe('#initialize') do
    it('will instantiate a new client with name and id attributes') do
      client = Client.new({:name => "Blam", :id => nil, :appointment_time => "2016-12-12 00:12:00", :stylist_id => nil})
      expect(client.name).to(eq("Blam"))
      expect(client.id).to(eq(nil))
      expect(client.appointment_time).to(eq("2016-12-12 00:12:00"))
      expect(client.stylist_id).to(eq(nil))
    end
  end
end
