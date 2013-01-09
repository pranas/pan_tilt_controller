require 'SocketIO'
require 'serialport'

serial = SerialPort.new ARGV.second, :baud => 115200

# try to convert input to Fixnum or Bignum
# limit it to 0-100 range
# map value to 0-65535 range
def parse_data(data)
  data = Integer(data) rescue 0
  data = [0, data].max
  data = [data, 100].min

  (data * 655.35).to_i
end

SocketIO.connect(ARGV.first) do
  before_start do
    on_event('pan') do |data|
      data = parse_data(data.first)
      puts "PAN #{data};"
      serial.write "PAN #{data};"
    end
    on_event('tilt') do |data|
      data = parse_data(data.first)
      puts "TILT #{data};"
      serial.write "TILT #{data};"
    end
  end
end

serial.close
