require "open3"
require_relative 'response'

module PaperCup
  class Request

    attr_accessor :method, :url, :headers, :params, :body

    def initialize(method:, url:, headers: {}, params: {}, body: "")
      @url = url
      @method = method
      @headers = headers
      @params = params
      @body = body
    end

    def exec
      Response.new(Open3.capture3(command).first)
    end

    def command
      @command ||= ["curl", build_method, http_code, build_headers, build_params, build_body, url].join(" ")
    end

    def http_code
      "-w %{http_code}"
    end

    def build_method
      "-X #{method.upcase}"
    end

    def build_headers
      @headers.map { |k, v| "-H '#{k}: #{v}'" }.join(" ")
    end

    def build_params
      @headers["Content-Type"] && @headers["Content-Type"].include?("json") ? "-d '#{params.to_json}'" : "-d '#{params}'"
    end

    def build_body
      body.empty? ? "" : "-d '#{body}'"
    end
  end
end
