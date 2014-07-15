class AngelListApi

  #call to the angel list api
  def self.angel_list_search(angel_list_id)
    HTTParty.get(URI.escape("https://api.angel.co/1/startups/#{angel_list_id}/jobs"))
  end
end
