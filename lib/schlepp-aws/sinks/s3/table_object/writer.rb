module Schlepp
  module AWS
    module Sink
      module S3
        # An S3 Object that is the gzipped data bound for a Redshift table.
        class TableObject
          class Writer
            # @param table_object TableObject::Base
            def initialize(table_object)
              @table_object = table_object

              @s3_obj = S3.bucket.objects[table_object.name]
            end

            def write(data)
              @s3_obj.write(data)
            end

            def delete
              @s3_obj.delete
            end
          end
        end
      end
    end
  end
end
