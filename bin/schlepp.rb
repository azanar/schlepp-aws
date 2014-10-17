#!/usr/bin/env ruby
$LOAD_PATH.push(File.dirname(__FILE__) + '/../lib')

require 'hydrogen'
require 'schlepp'
require 'schlepp-sink-s3'
require 'aws'

config = {
  :table_name => 'foo',
  :source => {:file => 'data.csv'},
  :columns => %w{foo bar baz}
}

AWS.config(
  access_key_id: '',
  secret_access_key: 'SECRET_ACCESS_KEY',
  stub_requests:     Schlepp.env.test?,
)

model = Hydrogen::Model.new(config)

source = Schlepp::Source::CSV.new(File.new('data.csv','r'))

sink = Schlepp::Sink::S3.new(model)

res = Schlepp.schlepp(source, sink)

puts res.inspect
