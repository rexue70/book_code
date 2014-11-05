#---
# Excerpted from "Deploying with JRuby",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jkdepj for more book information.
#---
class TwitterStreamService
  include TwitterUtil

  def initialize(opts={})
    @done = false
  end

  def start
    @thread = Thread.new do
      begin
        Status.find_or_create_from(
          fetch_tweets_since(since_id ||= nil) do |status|
            since_id = status["id"]
          end
        )
      # rescue => e
      #   puts "error: #{e.inspect}"
      end until @done
    end
  end

  def stop
    @done = true
    @thread.join
  end
  
end