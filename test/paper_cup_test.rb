require "test_helper"

describe PaperCup do

  describe "when doing a GET request to an url" do
    describe "that respond with a JSON" do
      it "must parse the response" do
        Open3.stub :capture3, [Mock.json] do   # stub goes away once the block is done
          r = PaperCup.get("http://www.google.com")
          assert_equal "Rails", r.body.first["framework"], "The framework must be rails"
        end
      end
    end
    describe "that does not respond with a JSON" do
      it "must set the response as it come" do
        Open3.stub :capture3, [Mock.html] do   # stub goes away once the block is done
          r = PaperCup.get("http://www.google.com")
          assert_equal Mock.html, "#{r.body}#{r.status}", "The response must be the same"
        end
      end
    end
  end
end
