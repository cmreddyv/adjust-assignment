require 'socket'

server = TCPServer.open('0.0.0.0', 80)

loop {
  client  = server.accept
  request = client.gets
  puts request
  ## To get status code as the probes are failing
  client.print "HTTP/1.1 200\r\n" # 1
  client.print "Content-Type: text/html\r\n" # 2
  client.print "\r\n" # 3
  method, path, version = request.lines[0].split
  if path == "/healthcheck"
    client.write("OK")
  else
    client.write("Well, hello there!")
  end
  client.close
}
