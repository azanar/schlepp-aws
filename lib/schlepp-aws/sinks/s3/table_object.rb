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
        end
      end
    end
  end
end
