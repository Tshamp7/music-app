feature "the signup process" do
    scenario "has a signup page" do
        visit new_user_url
        expect(page).to have_content("Sign Up")
    end

    scenario "signing up a user" do
        visit new_user_url
        fill_in "Email", with: Faker::Internet.email
        fill_in "Password", with: "Example1234"
        click_on "Create Account"
        expect(page).to have_content("Hello User!")
    end

    scenario "with an invalid user" do
        visit new_user_url
        fill_in "Email", with: Faker::Internet.email
        click_on "Create Account"
        expect(page).to have_content("Sign Up")
    end
end