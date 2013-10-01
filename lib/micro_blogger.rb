require 'jumpstart_auth'



class MicroBlogger
  attr_reader :client

  def dm(target, message)
     puts "d #{target} Trying to send this DM:"
     @client.direct_message_create(target, message)
     screen_names = @client.followers.collect{|follower| follower.screen_name}
  end

  

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "Sorry, your tweet length was greater than 140 characters. Please compose a shorter message and try again."
    end
  end

  def spam_my_followers(message)
    get_followers.each do |follower|
      dm(follower, message)
    end
  end

  def get_followers
    screen_names = @client.followers.collect do |follower|
      follower.screen_name
    end
  end

  def run
    command = ""
    while command != "q"
      puts ""
    printf "enter command: "
    input = gets.chomp
    parts = input.split
    command = parts[0]
    case command
      when 'q' then puts "Goodbye!"
      when 't' then tweet(parts[1..-1].join(" "))
      when 'dm' then dm(parts[1], parts[2..-1].join(" "))
      when 'spam' then spam_my_followers parts [1..-1].join(" ")
    else
      puts "Sorry, I don't know how to (#{command})"
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