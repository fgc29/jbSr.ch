
nyc_odata = []
until_count = 0
#until loop to get results that have more than a 1000 rows
until HTTParty.get("http://data.cityofnewyork.us/resource/ny8q-k43u.json?&$offset=#{until_count}").empty?

  nyc_odata = nyc_odata + HTTParty.get("http://data.cityofnewyork.us/resource/ny8q-k43u.json?&$offset=#{until_count}")
  until_count = until_count + 1000
end

#creating Company, some entries have no jobs or homepage url so using conditional to catch those!
company_create = nyc_odata.each do |co|
  Company.create({
    :name    => co['company_name'],
    #:url =>  (co['jobs_url'].nil? ? 'not provided' : co["jobs_url"]["url"]),
    :url => (if co['jobs_url'].nil? || co['url'].nil?
              if co['url'].nil? && co['jobs_url'].nil?
                'not provided'
              elsif co['jobs_url'].nil?
                  co['url']['url']
              end
            else
              co['jobs_url']['url']
            end
            ),
    :address => "#{co['address']}, #{co['address2']}, #{co['city']}, New York",
    :investor => (co["category_name"].downcase == "investors" ? true : false)
})
end



def search(search_term)

  co_srch = HTTParty.get(URI.escape("https://api.angel.co/1/search?query=#{search_term}&tag_type=CompanyTypeTag"))

  co_id = co_srch.select {|x| x["name"].downcase == search_term.downcase && x["type"] == "Startup"}

  if co_id.empty?
    co_id = {"product_desc" => nil, "logo_url" => nil, "twitter_url" => nil, "id" =>
      nil, "quality" => nil}
  else
    HTTParty.get("https://api.angel.co/1/startups/#{co_id[0]["id"]}")
  end

end

company_dataset = Company.all

company_dataset.each do |company|

  angellist_search = search(company.name)

  company.description = angellist_search["product_desc"].nil? ? 'not provided' : angellist_search["product_desc"]
  company.logo = angellist_search["logo_url"].nil? ? 'not provided' : angellist_search["logo_url"]
  company.twitter_url = angellist_search["twitter_url"].nil? ? 'not provided' : angellist_search["twitter_url"]
  company.angel_list_id = angellist_search["id"].nil? ? 'not provided' : angellist_search["id"]
  company.rating = angellist_search["quality"].nil? ? 'not provided' : angellist_search["quality"]
  company.save
  sleep 5
end
# binding.pry
