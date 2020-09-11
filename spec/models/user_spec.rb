require 'rails_helper'

RSpec.describe User, type: :model do
   it { should validate_presence_of(:email) }
   it { should validate_presence_of(:password_digest).with_message("Password can't be blank") }
   it { should validate_length_of(:password) }
   it { should validate_presence_of(:session_token) }

   test_user = User.find_by(email: "T.shamp@shample.com")
   # test_user password: "Example1234"

   describe 'is_password?' do
      it 'Should check the entered password against the Bcrypt password hash' do
         expect(test_user.is_password?("Example1234")).to be(true)
      end
   end

   describe 'find_by_credentials' do
      it 'Should check for an instance of the user with the supplied credentials' do
         expect(User.find_by_credentials("T.shamp@shample.com", "Example1234")).to be_an_instance_of(User)
      end
   end

   describe 'reset_session_token!' do
      it 'Should assign the user a session token and then save it.' do
         first_token = test_user.session_token
         test_user.reset_session_token!
         expect(test_user.session_token).not_to be(first_token)
      end
   end
end


