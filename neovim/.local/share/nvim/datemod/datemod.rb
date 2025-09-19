#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'chronic', '~> 0.10', require: true
end

require 'date'

input = ARGV.last || $stdin.read.strip

d = (Date.parse(input) rescue nil)
    .then do |v|
      v.nil? ? Chronic.parse(input) : v
    end

puts d.to_date.iso8601
