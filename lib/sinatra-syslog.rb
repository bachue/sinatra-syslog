require_relative 'sinatra/syslog/logger'

module Sinatra
  class Syslog < Rack::CommonLogger
    def initialize app, ident
      @app, @logger = app, Logger.new(ident)
    end

    def call env
      env['rack.logger'] = @logger
      env['rack.errors'] = @logger
      env['sinatra.commonlogger'] = true
      status, headers, body = super
      [status, headers, body]
    ensure
      body.close if body.respond_to? :close
    end

  private

    FORMAT = %{%s - %s "%s %s%s %s" %d %s %0.4f\n}
    def log(env, status, header, began_at)
      now = Time.now
      length = extract_content_length(header)

      logger = @logger || env['rack.errors']
      logger.write FORMAT % [
        env['HTTP_X_FORWARDED_FOR'] || env["REMOTE_ADDR"] || "-",
        env["REMOTE_USER"] || "-",
        env["REQUEST_METHOD"],
        env["PATH_INFO"],
        env["QUERY_STRING"].empty? ? "" : "?"+env["QUERY_STRING"],
        env["HTTP_VERSION"],
        status.to_s[0..3],
        length,
        now - began_at ]
    end
  end
end
