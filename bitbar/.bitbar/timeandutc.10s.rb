#!/usr/bin/env ruby

# <bitbar.title>⏰</bitbar.title>

now = Time.now
now_utc = now.dup.utc
zone_format = '%Z'
format = '%F %r %z'
times = [
  ["⏰ #{now.strftime(zone_format)}", now.strftime(format), 'steelblue'],
  ["🌎 #{now_utc.strftime(zone_format)}", now_utc.strftime(format), 'blueviolet'],
  ['💻 Unix', now.to_i, 'crimson']
]

puts "⏰"
puts "---"

times.each do |(label, time, color)|
  puts "#{label}: #{time} | color=#{color}"
end
