class Client
  attr_reader :name, :id, :appointment_time, :stylist_id

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @appointment_time = attributes.fetch(:appointment_time)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i
      appointment_time = client.fetch("appointment_time")
      stylist_id = client.fetch("stylist_id")
      clients.push(Client.new({:name => name, :id => id, :appointment_time => appointment_time, :stylist_id => stylist_id}))
    end
    clients
  end

end
