require 'schlepp/env'

module Schlepp
  module AWS
    module Sink
      module S3
        module_function

        def bucket
          @bucket ||= begin 
                        name = if Schlepp::env.production?
                                 "PRODUCTION"
                               elsif Schlepp::env.test?
                                 "TEST"
                               elsif Schlepp::env.development?
                                 "azanar_quasar"
                               end
                        if name
                          ::AWS::S3.new.buckets[name]
                        end
                      end
        end
      end
    end
  end
end
