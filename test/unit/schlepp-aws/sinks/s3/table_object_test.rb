require File.expand_path('../../../../test_helper', __FILE__)

require 'schlepp-aws/sinks/s3/table_object'
require 'schlepp-aws/sinks/s3/table_object/writer'

class Schlepp::AWS::Sink::S3::TableObjectTest < Test::Unit::TestCase
  include TestHelper 
  setup do
    @mock_table_object = mock
    @mock_table_object_name = "mock_table_name"

    @mock_table_object.expects(:name).returns(@mock_table_object_name)

    @mock_s3_bucket = mock
    Schlepp::AWS::Sink::S3.expects(:bucket).returns(@mock_s3_bucket)

    @mock_s3_bucket_objects = mock
    @mock_s3_bucket.expects(:objects).returns(@mock_s3_bucket_objects)

    @mock_s3_bucket_object = mock
    @mock_s3_bucket_objects.expects(:[]).with(@mock_table_object_name).returns(@mock_s3_bucket_object)

    s3_table_object = Schlepp::AWS::Sink::S3::TableObject.new(@mock_table_object)
    @writer = Schlepp::AWS::Sink::S3::TableObject::Writer.new(s3_table_object)
  end

  test '#write' do
    @mock_s3_bucket_object.expects(:write).with("FOO|BAR|BAZ")
    @writer.write("FOO|BAR|BAZ")
  end

end