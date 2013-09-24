require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "Sorry, your tweet length was greater than 140 characters. Please compose a shorter message and try again."
    end
  end

  def run
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
    printf "enter command: "
    command = gets.chomp
    case command
    when 'q' then puts "Goodbye!"
    else
      puts "Sorry, I don't know how to #{command}"
  end
  end
  end

  def initialize
    puts "Initializing..."
    @client = JumpstartAuth.twitter
  end
end
blogger = MicroBlogger.new
blogger.run