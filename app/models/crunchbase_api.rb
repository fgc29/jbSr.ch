class CrunchbaseApi
  #call to the api
  def self.call(search)
    # HTTParty.get(URI.escape("http://api.crunchbase.com/v/2/organization/#{search}?user_key=7bfa6ebfc4589235d83f2d050a58b4a3"))
    HTTParty.get(URI.escape("http://api.crunchbase.com/v/2/organization/#{search}?user_key=#{ENV["CRUNCHBASE_API_KEY"]}"))
  end

  #filtering the parameter to make the call to api valid
  def self.crunchbase_search(search_term)

    char_rm = search_term.gsub(/[^0-9A-Za-z]/, ' ')
    a = char_rm.split(/ /).join('-')
    b = char_rm.split(/ /).join("")
    c = char_rm.split(/ /).join('-').downcase
    d = char_rm.split(/ /).join("").downcase

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

  #update for the companies database entry
  def self.update_db(search_term)

    co_info = self.crunchbase_search(search_term)

    co = Company.find_by(name: search_term)

    co.description =
      co_info["data"]["properties"]["description"]
    co.hi_concept =
      co_info["data"]["properties"]["short_description"]
    co.email =
      co_info["data"]["properties"]["email_address"]
    co.employee_count =
      co_info["data"]["properties"]["number_of_employees"]
    co.crunchbase_permalink =
      co_info["data"]["properties"]["permalink"]
    co.founded =
      co_info["data"]["properties"]["founded_on_year"]
    co.founders =
      co_info["data"]["relationships"]["founders"].nil? ? "not provided" :
      co_info["data"]["relationships"]["founders"]["items"].map{|x| x["name"]}.join(", ")
    co.market =
      co_info["data"]["relationships"]["categories"].nil? ? "not provided" :
      co_info["data"]["relationships"]["categories"]["items"].map{|x| x["name"]}.join(", ")
    co.founded =
      co_info["data"]["properties"]["founded_on_year"]
    co.save
  end

end
