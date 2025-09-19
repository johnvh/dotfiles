# frozen_string_literal: true

require 'open3'

com = "#{__dir__}/datemod.rb"

cases = [
  %w[9/21/84 1984-09-21],
  %w[9/21/1984 1984-09-21],
  %w[19840921 1984-09-21]
]
require 'pry-byebug'

cases.each do |(input, expected)|
  cmd = "ruby #{com} '#{input}'"

  result, out = Open3.popen2e(cmd) do |stdin, stdout_and_stderr, wait_thr|
    [wait_thr.value, stdout_and_stderr.read.chomp]
  end

  unless out == expected
    $stderr.puts "input: #{input}, expected: #{expected}, actual: #{out}"
  end
end
