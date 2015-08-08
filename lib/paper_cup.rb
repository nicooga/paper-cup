require "./lib/paper_cup/request.rb"
module PaperCup

  INSERT_METHODS = %w(post put)
  QUERY_METHODS = %w(get head)
  METHODS = INSERT_METHODS + QUERY_METHODS

  METHODS.each do |method|
    define_singleton_method(method) do |url, body: '', headers: {}, params: {}|
      Request.new(method: method, url: url, body: body, headers: headers, params: params).exec
    end
  end
end
