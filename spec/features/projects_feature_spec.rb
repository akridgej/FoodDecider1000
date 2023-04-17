require "rails_helper"
RSpec.feature "Projects", type: :feature do

    context "Update project" do

      let(:project) { Project.create(restaurant: "Test title", foodCombo: "Test content", rating: 8) }
      
      before (:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_project_path(project)
      end

      scenario "should be successful" do
        within("form") do
          fill_in "Combo", with: "New content"
        end
        click_button "Update Project"
        expect(page).to have_content("")
      end
 
      scenario "should fail" do
        within("form") do
          fill_in "Combo", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("")

        within("form") do
          fill_in "Restaurant", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("")

        within("form") do
          fill_in "Rating", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("")

      end
    end

    context "Login" do
      scenario "should sign up" do
        visit root_path
        click_button("Account")
        click_button("Sign Up")
        within("form") do
          fill_in "Email", with: "testing@test.com"
          fill_in "Password", with: "123456"
          fill_in "Password confirmation", with: "123456"
          click_button "Sign Up"
        end
        expect(page).to have_content("")
      end
  
  
      scenario "should log in" do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
        expect(page).to have_content("Logged in")
      end
    end

    context "Create project" do
      
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_project_path
      end

      scenario "should be successful" do
         within "form" do
            fill_in "Restaurant", with: "New Restaurant"
            fill_in "Combo", with: "New combo"
            fill_in "Rating", with: 8
         end

         click_button "Create Project"
         expect(page).to have_content("")
      end
   end
end
