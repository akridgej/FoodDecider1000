require "rails_helper"
RSpec.feature "Projects", type: :feature do
    context "Update project" do
      let(:project) { Project.create(restaurant: "Test title", foodCombo: "Test content", rating: 8) }
      
      before(:each) do
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
        expect(page).to have_content("Foodcombo can't be blank")
      end
    end
end
