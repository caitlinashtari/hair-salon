class Client
  attr_reader :name, :appointment_time, :stylist_id

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)

    @appointment_time = attributes.fetch(:appointment_time)
    @stylist_id = attributes.fetch(:stylist_id).to_i
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch("name")
      appointment_time = client.fetch("appointment_time")
      stylist_id = client.fetch("stylist_id").to_i
      clients.push(Client.new({:name => name, :appointment_time => appointment_time, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, appointment_time, stylist_id) VALUES ('#{@name}', '#{@appointment_time}', #{@stylist_id});")
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
  end

end
