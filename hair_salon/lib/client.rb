class Client
  attr_reader :name, :id, :appointment_time, :stylist_id
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @appointment_time = attributes.fetch(:appointment_time)
    @stylist_id = attributes.fetch(:stylist_id)
  end
end
