require "rails_helper"
describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating project" do
      project = Project.new(foodCombo: "Content of the description")
      expect(project.valid?).to eq(false)
    end
    it "ensures the description is present when creating project" do
        project = Project.new(restaurant: "Title")
        expect(project.valid?).to eq(false)
    end
    it "ensures the rating is present when creating project" do
        project = Project.new(foodCombo: "Content of the description")
        expect(project.valid?).to eq(false)
    end
    it "should not be able to save project when title missing" do
      project = Project.new(foodCombo: "Some description content goes here")
      expect(project.save).to eq(false)
    end
    it "should not be able to save project when description is missing" do
        project = Project.new(restaurant: "Some title goes here")
        expect(project.save).to eq(false)
    end
    it "should not be able to save project when rating missing" do
        project = Project.new(restaurant: "Some title goes here", foodCombo: "Some description content goes here")
        expect(project.save).to eq(false)
    end
    it "should be able to save project when restaurant, foodCombo and rating are present" do
      project = Project.new(restaurant: "Title", foodCombo: "Content of the description", rating: 9)
      expect(project.save).to eq(true)
    end
  end
end
describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @project = Project.create(restaurant: "Title", foodCombo: "Content of the description", rating: 9)
    end
    it "ensures the title is present when editing project" do
      @project.update(:restaurant => "New Title")
      expect(@project.restaurant == "New Title")
    end
    it "ensures the description is present when editing project" do
        @project.update(:foodCombo => "New description")
        expect(@project.foodCombo == "New description")
    end
    it "ensures the rating is present when editing project" do
        @project.update(:rating => 8)
        expect(@project.rating == 8)
    end
  end
end
