require "test_helper"

describe PaperCup::Request do

  describe "when the request is only url and method" do
    it "must upcase the method for the command" do
      r = PaperCup::Request.new(method: "get", url: "https://www.google.com.ar")
      assert r.command.include?("-X GET"), "The command does not have the method upcased"
    end

    it "must add 'httt_code' to the command in order to get the status code" do
      r = PaperCup::Request.new(method: "get", url: "https://www.google.com.ar")
      assert r.command.include?("-w %{http_code}"), "The command does not include 'http_code'"
    end
  end

  describe "when the request have headers" do
    it "must add them to the command" do
      r = PaperCup::Request.new(method: "get", url: "https://www.google.com.ar",
                                headers: { "Content-Type" => "application/json"})
      assert r.command.include?("-H 'Content-Type: application/json'"), "The command does not have the method upcased"
    end
  end

  describe "when the request\'s content type is json" do
    it "the params must be json" do
      params = { pepe: { holis: 3 }, pepa: 3 }
      r = PaperCup::Request.new(method: "get", url: "https://www.google.com.ar",
                                params: params,
                                headers: { "Content-Type" => "application/json"})
      assert r.command.include?(params.to_json), "The command does not have the params as a json"
    end
  end

  describe "when the request\'s content type is not json" do
    it "the params must be json" do
      params = "<html><header></header><body><h1>HOLA</h1></body></html>"
      r = PaperCup::Request.new(method: "get", url: "https://www.google.com.ar",
                                params: params,
                                headers: { "Content-Type" => "application/xml"})
      assert r.command.include?(params), "The command does not have the params"
    end
  end

  describe "when the request\'s have body" do
    it "the body must be present" do
      body = { total: 3.12 }.to_json
      r = PaperCup::Request.new(method: "get", url: "https://www.google.com.ar",
                                body: body, headers: { "Content-Type" => "application/json"})
      assert r.command.include?(body), "The command does not have the body"
    end
  end

  describe "when the request\'s have no body" do
    it "there must not be an empty body" do
      r = PaperCup::Request.new(method: "get", url: "https://www.google.com.ar")
      refute r.command.include?("-d ''"), "The command does have the body"
    end
  end
end
