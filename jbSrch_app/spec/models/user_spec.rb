require 'rails_helper'

describe User do
  let(:les) {User.new( username: "lac",
                       first_name: "Leslie",
                       last_name: "Castillo",
                       email: "lac@gmail.com",
                       password: "juji",
                       password_confirmation: "juji")
}
  it 'is a valid with a username, email, and password' do
    expect(les).to be_valid
  end

  it {is_expected.to validate_presence_of :first_name}
  it {is_expected.to validate_presence_of :last_name}
  it {is_expected.to validate_presence_of :email}

  it 'is invalid without a password' do
    expect(User.new(password_digest: nil)).to have(1).errors_on(:password)
  end

  it {is_expected.to validate_uniqueness_of :username}
  
end
