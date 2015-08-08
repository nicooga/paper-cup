require "test_helper"

describe PaperCup::Response do

  describe "when the response is not JSON" do
    it "must set the response as it came " do
      assert_nothing_raised { PaperCup::Response.new(Mock.html) }
    end

    it "must set the status code response properly" do
      r = PaperCup::Response.new(Mock.html)
      assert_equal 404, r.status
    end

  end

  describe "when the response is a JSON" do
    it "must set the response properly" do
      r = PaperCup::Response.new(Mock.json)
      assert_equal JSON.parse(Mock.json[0..-4]), r.response
    end

    it "must set the status code response properly" do
      r = PaperCup::Response.new(Mock.json)
      assert_equal 200, r.status
    end
  end
end
