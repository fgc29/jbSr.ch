require 'rails_helper'

describe Company do
  let(:google) { Company.new( co_name: "Google",
                              co_url: "www.google.com/careers",
                              co_address: "100 9th ave, N.Y., N.Y."
                              )
}
  it 'is valid with co_name, co_url and co_address' do
    expect(google).to be_valid
  end

  it 'is invalid without co_name' do
    expect(Company.new(co_name: nil)).to have(1).errors_on(:co_name)
  end

  it 'is invalid without co_url' do
    expect(Company.new(co_url: nil)).to have(1).errors_on(:co_url)
  end

  it 'is invalid without co_address' do
    expect(Company.new(co_address: nil)).to have(1).errors_on(:co_address)
  end

  it 'is invalid without unique co_name' do
    google.save!
    twitter = Company.new({ co_name: "Google",
                            co_url: "www.twitter.com",
                            co_address: "100 5th ave, N.Y., New York"})
    expect(twitter).to have(1).errors_on(:co_name)
  end

  it 'is invalid without unique co_name' do
    google.save!
    twitter = Company.new({ co_name: "Twitter",
                            co_url: "www.google.com/careers",
                            co_address: "100 5th ave, N.Y., New York"})
    expect(twitter).to have(1).errors_on(:co_url)
  end
end
