#!/usr/bin/env ruby

def conversation
  puts 'Hello.'
  yield
  puts 'Goodbye.'
end

def five_times(proc)
  1.upto(5) do |number|
    # yield number
    proc.call(number)
  end
end

def n_times(number, proc)
  1.upto(number) do |count|
    # yield count
    proc.call(count)
  end
end
conversation { puts 'Good to meet you.' }
puts

exercise_block = proc do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end

five_times exercise_block
puts

n_times 5, exercise_block
