require File.expand_path('../test_helper', __FILE__)

require 'schlepp'
require 'schlepp-sink-s3'

class Schlepp::IntegrationTest < Test::Unit::TestCase
  setup do
    @stub_s3_bucket = stub
    Schlepp::Sink::S3.stubs(:bucket).returns(@stub_s3_bucket)

    @stub_s3_objects = stub
    @stub_s3_bucket.stubs(:objects).returns(@stub_s3_objects)

    @mock_s3_object = mock
    @stub_s3_objects.stubs(:[]).returns(@mock_s3_object)

    @mock_model = mock
    @mock_model.expects(:kind_of?).with(Hydrogen::Model).returns(true)
    @mock_model.expects(:name).at_least_once.returns("mock_models")
  end

  test 'stuff' do
    #s3_table_object = Schlepp::Sink::S3::TableObject.new(table_object)
    sink = Schlepp::Sink::S3.new(@mock_model)

    data = ["FOO|BAR|BAZ"] * 10

    data.each do |d|
      @mock_s3_object.expects(:write).with(d)
    end
    sink.write(["FOO|BAR|BAZ"] * 10)

    sink.finalize
  end
end

