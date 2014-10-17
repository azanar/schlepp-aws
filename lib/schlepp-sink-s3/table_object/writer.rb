module Schlepp
  class Sink
    class S3
      # An S3 Object that is the gzipped data bound for a Redshift table.
      class TableObject
        class Writer
          # @param table_object TableObject::Base
          def initialize(sink, table_object)
            @table_object = table_object

            @s3_obj = sink.bucket.objects[table_object.name]
            @written = 0
          end

          def finalize
            @table_object
          end

          def written
            @written
          end

          def write(data)
            data.each do |d|
              @s3_obj.write(d)
            end
          end

          def delete
            @s3_obj.delete
          end
        end
      end
    end
  end
end
