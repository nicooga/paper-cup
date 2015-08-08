module PaperCup
  def self.valid_json?(json)
    JSON.parse(json)
    true
  rescue
    false
  end
end
