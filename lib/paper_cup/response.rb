require 'json'
require_relative 'utils'

module PaperCup
  class Response
    attr_accessor :status, :response

    def initialize(response)
      set_response(response[0..-4])
      @status = response[-3..-1].to_i
    end

    def success?
      status.between?(200, 299)
    end

    private

    def set_response(response)
      @response = PaperCup.valid_json?(response) ? JSON.parse(response) : response
    end
  end
end
