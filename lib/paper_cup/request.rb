require "open3"
require_relative 'response'

module PaperCup
  class Request

    attr_accessor :method, :url, :headers, :params, :body

    COMMAND_TEMPLATE = "curl -X %{method} -w %%{http_code} %{headers} %{params} %{body} %{url}"

    def initialize(method:, url:, headers: {}, params: {}, body: "")
      @url, @method, @headers, @params, @body = url, method, headers, params, body
    end

    def exec
      Response.new(Open3.capture3(command).first)
    end

    def command
      COMMAND_TEMPLATE % {
        method:  method.upcase,
        headers: build_headers,
        params:  build_params,
        body:    build_body,
        url:     url
      }
    end

    def build_headers
      @headers.map { |k, v| "-H '#{k}: #{v}'" }.join(" ")
    end

    def build_params
      json_request? ? "-d '#{params.to_json}'" : "-d '#{params}'"
    end

    def json_request?
      @headers["Content-Type"] && @headers["Content-Type"].include?("json")
    end

    def build_body
      body.empty? ? "" : "-d '#{body}'"
    end
  end
end
