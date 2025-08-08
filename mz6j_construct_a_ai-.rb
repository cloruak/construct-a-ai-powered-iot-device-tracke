Ruby
require 'json'

class Device
  attr_accessor :id, :name, :mac_address, :ip_address, :location

  def initialize(id, name, mac_address, ip_address, location)
    @id = id
    @name = name
    @mac_address = mac_address
    @ip_address = ip_address
    @location = location
  end

  def to_json
    {
      id: @id,
      name: @name,
      mac_address: @mac_address,
      ip_address: @ip_address,
      location: @location
    }.to_json
  end
end

class Tracker
  attr_accessor :devices

  def initialize
    @devices = []
  end

  def add_device(device)
    @devices << device
  end

  def remove_device(device_id)
    @devices.delete_if { |device| device.id == device_id }
  end

  def get_device(device_id)
    @devices.find { |device| device.id == device_id }
  end

  def update_device_location(device_id, location)
    device = get_device(device_id)
    if device
      device.location = location
    end
  end

  def to_json
    {
      devices: @devices.map { |device| device.to_json }
    }.to_json
  end
end

class AIModel
  def initialize
    @tracker = Tracker.new
  end

  def train
    # implement AI model training logic here
  end

  def predict_device_location(device_id)
    # implement AI model prediction logic here
    # for now, return a random location
    { lat: rand(100), lon: rand(100) }
  end
end

tracker = Tracker.new
ai_model = AIModel.new

# sample data
device1 = Device.new(1, 'Device 1', '00:11:22:33:44:55', '192.168.1.100', { lat: 10, lon: 20 })
device2 = Device.new(2, 'Device 2', '00:22:33:44:55:66', '192.168.1.101', { lat: 20, lon: 30 })

tracker.add_device(device1)
tracker.add_device(device2)

puts tracker.to_json
puts ai_model.predict_device_location(1).to_json