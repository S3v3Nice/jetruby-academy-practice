# frozen_string_literal: true

require 'socket'

class SimpleRackServer
  def initialize(app, port = 8080)
    @app = app
    @port = port
  end

  def start
    server = TCPServer.new(@port)
    puts "Listening on port #{@port}"

    while (connection = server.accept)
      request = connection.gets
      next unless request

      method, full_path = request.split(' ')
      path, query = full_path.split('?')

      status, headers, body = @app.call(
        {
          'REQUEST_METHOD' => method,
          'PATH_INFO' => path,
          'QUERY_STRING' => query,
        }
      )

      connection.print("HTTP/1.1 #{status}\r\n")
      headers.each do |key, value|
        connection.print("#{key}: #{value}\r\n")
      end
      connection.print("\r\n")

      body.each do |part|
        connection.print(part)
      end

      connection.close
    end
  end
end
