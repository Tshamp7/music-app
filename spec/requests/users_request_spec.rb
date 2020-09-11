require 'rails_helper'
# CONTROLLER TESTING IS A STUPID WASTE OF TIME. INTEGRATION AND UNIT TESTS COVER ALL OF THIS.
RSpec.describe "Users", type: :request do
    describe "GET #new" do
        it "renders the new template" do
            get "http://localhost:3000/users/new"
            expect(response).to render_template("new")
        end
    end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post users_path, params: { user: { email: Faker::Internet.email } }
        expect(response).to render_template("new")
        expect(flash[:error]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post users_path, params: { user: { email: Faker::Internet.email, password: "12345" } }
        expect(response).to render_template("new")
        expect(flash[:error]).to be_present
      end

    end

    context "with valid params" do
      it "redirects user to their show page on success" do
        post users_path, params: { user: { email: Faker::Internet.email, password: "Example1234" } }
        expect(flash[:error]).to be(nil)
      end
    end
  end

end
