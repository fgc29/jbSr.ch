class CrunchbaseApi

  def self.call(search) HTTParty.get(URI.escape("http://api.crunchbase.com/v/2/organization/#{search}?user_key=7bfa6ebfc4589235d83f2d050a58b4a3"))
  end

  def self.crunchbase_search(search_term)

    a = search_term.split(/ /).join('-')
    b = search_term.split(/ /).join("")
    c = search_term.split(/ /).join('-').downcase
    d = search_term.split(/ /).join("").downcase

    if self.call(a)["data"]["response"].nil?
      self.call(a)
    elsif self.call(b)["data"]["response"].nil?
      self.call(b)
    elsif self.call(c)["data"]["response"].nil?
      self.call(c)
    elsif self.call(d)["data"]["response"].nil?
      self.call(d)
    else
      "not available"
    end
  end

end
