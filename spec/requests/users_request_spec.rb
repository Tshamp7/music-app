require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe "GET #new" do
        it "renders the new template" do
            get "http://localhost:3000/users/new"
            expect(response).to render_template("new")
        end
    end

    describe "POST #create" do
        context "with invalid params" do
            it "renders the new users path"

            it "sets a flash error message"
        end

        context "with valid params" do

        end
    end

end
