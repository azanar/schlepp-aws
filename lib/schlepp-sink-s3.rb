require 'aws'
require 'schlepp'

require 'schlepp-sink-s3/env'
require 'schlepp-sink-s3/table_object/factory'

module Schlepp
  class Sink
    class S3
      def initialize(model, opts = {})
        @model = model
        factory = Schlepp::Sink::S3::TableObject::Factory.new(self, @model.name)
        @sink = Schlepp::Sink.new(model, factory, Array(opts[:filters]) || [])
      end

      def root
        @root ||= URI("s3://s3.amazonaws.com/#{bucket.name}/")
      end

      def uri(basename)
        @uri ||= root.merge(basename)
      end

      def write(data)
        @sink.write(data)
      end

      def finalize
        @sink.finalize
      end

      attr_reader :model
      attr_reader :sink
    end
  end
end
