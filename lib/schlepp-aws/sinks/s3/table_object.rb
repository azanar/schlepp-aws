require 'schlepp-aws/sinks/s3/env'
require 'schlepp-aws/table_object'

module Schlepp
  module AWS
    module Sink
      module S3
        # An S3 Object that is the gzipped data bound for a Redshift table.
        class TableObject
          def initialize(table_object)
            @table_object = table_object
          end

          def path
            @table_object.path
          end

          def name
            @table_object.name
          end

          def url
            "s3://#{S3.bucket.name}/#{path}"
          end

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
