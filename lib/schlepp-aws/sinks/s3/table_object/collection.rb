require 'schlepp-aws/sinks/s3/table_object'

module Schlepp
  module AWS
    module Sink
      module S3
        class TableObject
          class Collection
            include Hydrogen::TableObject::Collection

            def url
              "file:///#{path}"
            end

            def urls
              parts.map do |p|
                TableObject.new(p).url
              end
            end
          end
        end
      end
    end
  end

end
