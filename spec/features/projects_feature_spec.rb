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
        project.foodCombo = "New content"
        click_button "Update Project"
        expect(page).to have_content("")
      end
 
      scenario "should fail" do
        project.foodCombo = ""
        click_button "Update Project"
        expect(page).to have_content("")
      end
    end

    context "Login" do
      scenario "should sign up" do
        user = FactoryBot.create(:user)
        visit new_user_registration_path
        user.email = "user@example2.com"
        user.password = "123456"
        click_button "Sign Up"
        expect(page).to have_content("")
      end
    end
  
  
      scenario "should log in" do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
        expect(page).to have_content("Logged in")
      end
    end

    context "Create project" do

      let(:project) { Project.create(restaurant: "", foodCombo: "") }
      
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit new_project_path
      end

      scenario "should be successful" do
        
        project.restaurant = "New Restaurant"
        project.foodCombo = "New combo"
        project.rating = 8
        click_button "Create Project"
        expect(page).to have_content("")
      end
   end

