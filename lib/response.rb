class Response
  attr_accessor :status, :response

  def initialize(response)
    @response = JSON.parse(response[0..-4])
    @status = response[-3..-1].to_i
  end

  def success?
    status.between?(200, 299)
  end
end
