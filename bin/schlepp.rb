$LOAD_PATH.push(File.dirname(__FILE__) + '/../lib')

require 'hydrogen'
require 'schlepp'
require 'schlepp/sinks/fs'
require 'schlepp-aws/sinks/aws/s3'
require 'aws'

config = {
  :table_name => 'foo',
  :source => {:file => 'data.csv'},
  :columns => %w{foo bar baz}
}

AWS.config(
  access_key_id: 'ACCESS_KEY_ID',
  secret_access_key: 'SECRET_ACCESS_KEY',
  stub_requests:     Schlepp.env.test?,
)

model = Hydrogen::Model.new(config)

to = Hydrogen::TableObject.new(model)

source = Schlepp::Source::CSV.new(File.new('data.csv','r'))

l = Schlepp::AWS::Sink::S3::Sequencer.new(to, :chunk_size => 40000)

res = Schlepp.schlepp(source, l)

puts res.inspect
