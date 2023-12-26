#!/Users/jvanhorn/.asdf/installs/ruby/3.2.2/bin/ruby

# <bitbar.title>⏰</bitbar.title>

# need to gem install this
require 'tzinfo'

now = Time.now
now_utc = now.dup.utc
zone_format = '%Z'
format = '%F %r %z (%k:%M)'

get_times = ->(tz, icon, color) do
  t = now.localtime(tz)
  ["#{icon} #{t.strftime(zone_format)}", t.strftime('%F %r %z (%k:%M)'), color]
end

times = [
  get_times.call(TZInfo::Timezone.get('America/New_York'), '⏰', 'steelblue'),

  # ["⏰ #{now.strftime(zone_format)}", now.strftime('%F %r %z (%k:%M)'), 'steelblue'],
  get_times.call(TZInfo::Timezone.get('America/Chicago'), '⏰', 'steelblue'),

  # ["🌎 #{now_utc.strftime(zone_format)}", now_utc.strftime(format), 'blueviolet'],
  get_times.call(TZInfo::Timezone.get('Etc/UTC'), '🌎', 'blueviolet'),
  ['💻 Unix', now.to_i, 'crimson']
]

puts "⏰"
puts "---"

# puts RUBY_VERSION
# puts ENV['PATH']

times.each do |(label, time, color)|
  puts "#{label}: #{time} | color=#{color}"
end
