def weekday
  current_time = Time.new
  current_time.strftime('%A')
end

def movie_listing(title, rank = 0)
  "#{weekday.upcase}: #{title.capitalize} has a rank of #{rank}."
end

puts movie_listing('goonies', 10)
puts movie_listing('ghostbusters', 9)

a_title = 'goldfinger'
puts movie_listing(a_title)
