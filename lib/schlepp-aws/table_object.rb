module Schlepp
  module AWS
    class TableObject
      def initialize(table_object)
        @table_object = table_object
      end

      def path
        @table_object.path
      end

      def url
        "s3://#{S3.bucket.name}/#{path}"
      end
    end
  end
end
