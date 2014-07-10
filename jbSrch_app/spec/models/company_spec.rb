require 'rails_helper'

describe Company do
  let(:google) { Company.new( name: "Google",
                              url: "www.google.com/careers",
                              address: "100 9th ave, N.Y., N.Y."
                              )
}
  it 'is valid with co_name, co_url and co_address' do
    expect(google).to be_valid
  end

  it {is_expected.to validate_presence_of :name}
  it {is_expected.to validate_presence_of :url}
  it {is_expected.to validate_presence_of :address}
  it {is_expected.to validate_uniqueness_of :name}

end
