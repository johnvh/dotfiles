#!/usr/bin/env ruby


require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'chronic', '~> 0.10', require: true
end

d = Chronic.parse($stdin.read.strip)
puts d.to_date.iso8601
