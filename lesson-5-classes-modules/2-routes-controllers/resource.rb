# frozen_string_literal: true

module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp.upcase

      break if verb == 'Q'
      next unless %w[GET POST PUT DELETE].include?(verb)

      action = nil

      if verb == 'GET'
        loop do
          print 'Choose action (index/show) / q to exit: '
          action = gets.chomp.downcase
          break if %w[index show q].include?(action)
        end
      end

      break if action == 'q'

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end
