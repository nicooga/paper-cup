require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/paper_cup.rb'
Dir.glob(['./lib/**/*.rb']).each { |r| require r }

module Mock
  class << self
    def html
      "<html>\n<head>\n<meta charset=\"UTF-8\">\n<title>404</title>\n</head>\n<body>\n<code>404</code>\n</body>\n</html>\n404"
    end

    def json
      "[{\"name\":\"Mariano\",\"code\":\"ruby\"}]200"
    end
  end
end

module Minitest::Assertions
  def assert_nothing_raised(*)
    yield
  end
end

