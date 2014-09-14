require 'schlepp/sink/sequencer'
require 'schlepp-aws/sinks/s3/chunker' 
require 'schlepp-aws/sinks/s3/table_object/collection'

module Schlepp
  module AWS
    module Sink
      module S3
        class Sequencer
          include Schlepp::Sink::Sequencer

          def collection
            Schlepp::AWS::Sink::S3::TableObject::Collection
          end

          def chunker
            Schlepp::AWS::Sink::S3::Chunker
          end
        end
      end
    end
  end
end
