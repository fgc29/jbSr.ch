class AngelListApi

  def self.angel_list_search(angel_list_id)
  # def self.search
    HTTParty.get(URI.escape("https://api.angel.co/1/startups/#{angel_list_id}/jobs"))
    # HTTParty.get(URI.escape("https://api.angel.co/1/startups/74139/jobs"))
  end
end
