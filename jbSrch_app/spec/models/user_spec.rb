require 'rails_helper'

describe User do
  let(:les) {User.new( username: "lac",
                        f_name: "Leslie",
                        l_name: "Castillo",
                        email: "lac@gmail.com",
                        password: "juji",
                        password_confirmation: "juji")
}
  it 'is a valid with a username, email, and password' do
    expect(les).to be_valid
  end

  it 'is invalid without a firstname' do
    expect(User.new(f_name: nil)).to have(1).errors_on(:f_name)
  end

  it 'is invalid without a lastname' do
    expect(User.new(l_name: nil)).to have(1).errors_on(:l_name)
  end

  it 'is invalid without a email' do
    expect(User.new(email: nil)).to have(1).errors_on(:email)
  end

  it 'is invalid without a password' do
    expect(User.new(password_digest: nil)).to have(1).errors_on(:password)
  end

  it 'is invalid without a unique username' do
    les.save!
    juji = User.new( username: "lac",
                          f_name: "Judah",
                          l_name: "Castillo",
                          email: "jmc@gmail.com",
                          password: "juji",
                          password_confirmation: "juji")
  end
  
end
