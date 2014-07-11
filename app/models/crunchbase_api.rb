class CrunchbaseApi

  def self.crunchbase_search(search_term)

    search_term = search_term.split(/ /).join('-')
    # search_term.to_s
      # HTTParty.get(URI.escape("http://api.crunchbase.com/v/2/organization/#{search_term}?user_key=#{ENV["CRUNCHBASE_API_KEY"]}"))
      HTTParty.get(URI.escape("http://api.crunchbase.com/v/2/organization/#{search_term}?user_key=7bfa6ebfc4589235d83f2d050a58b4a3"))

  end

end
