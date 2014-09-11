require 'schlepp/sink/sequencer'
require 'schlepp-aws/sinks/s3/chunker'

module Schlepp
  module AWS
    module Sink
      module S3
        class Sequencer
          include Schlepp::Sink::Sequencer

          def chunker
            Schlepp::AWS::Sink::S3::Chunker
          end
        end
      end
    end
  end
end
