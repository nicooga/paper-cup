require "open3"
require "response"

class PaperCup

  INSERT_METHODS = %w(post put)
  QUERY_METHODS = %w(get head)
  METHODS = INSERT_METHODS + QUERY_METHODS

  METHODS.each do |method|
    define_singleton_method(method) do |url, body = ''|
      exec(build_curl(method, url, body))
    end
  end

  private

  class << self
    def exec(command)
      Response.new(Open3.capture3(command).first)
    end

    def build_curl(type, url, body)
      ["curl", "-X #{type.upcase}", "-w %{http_code}", "-H 'Content-Type: application/json'", "-d '#{body}'", url].join(" ")
    end
  end
end
