require 'schlepp/sink/loader'

require 'schlepp-aws/sinks/s3/table_object'
require 'schlepp-aws/sinks/s3/table_object/writer'

module Schlepp
  module AWS
    module Sink
      module S3
        class Chunker
          def initialize(table_object, opts = {})
            @table_object = table_object
            @wrapped = []
          end

          attr_reader :wrapped

          def sequence
            chunker.sequence
          end

          def parts
            chunker.parts
          end

          def next
            part = chunker.next 

            s3_table_obj = Schlepp::AWS::Sink::S3::TableObject.new(part)

            @wrapped << s3_table_obj

            writer = Schlepp::AWS::Sink::S3::TableObject::Writer.new(s3_table_obj)

            Schlepp::Sink::Loader.new(writer)
          end
          
          private

          def chunker
            @chunker ||= Schlepp::Sink::Chunker.new(@table_object)
          end
        end
      end
    end
  end
end
