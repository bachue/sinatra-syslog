require 'syslog/logger'

module Sinatra
  class Syslog < Rack::CommonLogger
    class Logger < ::Syslog::Logger
      def write content
        content.each_line { |line| info line }
      end
      def puts content
        content.each_line { |line| error line }
      end
      def flush ; end
      def close ; end
    end
  end
end
