require 'json'
require_relative 'utils'

module PaperCup
  class Response
    attr_accessor :status, :response

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def response
      @response ||= begin
        str = @raw_response[0..-4]
        PaperCup.valid_json?(str) ? JSON.parse(str) : str
      end
    end

    def status
      @status ||= @raw_response[-3..-1].to_i
    end

    def success?
      status.between?(200, 299)
    end
  end
end
