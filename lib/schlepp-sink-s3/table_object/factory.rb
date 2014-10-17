require 'schlepp-sink-s3/table_object/writer'
module Schlepp
  class Sink
    class S3
      class TableObject
        class Factory
          def initialize(sink, basename)
            @sink = sink
            @basename = basename
          end

          def model
            @sink.model
          end

          def url
            @url ||= URI(@sink.root.merge(@basename))
          end

          def writer(to)
            Writer.new(@sink, to)
          end
        end
      end
    end
  end
end

