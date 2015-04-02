project1 = 'ABC'
project2 = 'LMN'
project3 = 'XYZ'

funding1 = 1000
funding2 = 500
funding3 = 25

puts "Projects:\n\t- #{project1}\n\t- #{project2}\n\t- #{project3}"
puts

puts "Project #{project1} has $#{funding1} in funding."

project2_format = "Project #{project2}".ljust(20) + "$#{funding2}".rjust(20)
puts project2_format

project3_format = "Project #{project3} : $#{funding3}".center(40, '_')
puts project3_format

puts
total_funding = funding1 + funding2 + funding3
formatted_time = Time.new.strftime('%H:%M on %A, %B %-d %y')
puts "Total funding is $#{total_funding} as of #{formatted_time}."
