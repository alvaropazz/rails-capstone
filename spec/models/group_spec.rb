require 'rails_helper'

RSpec.describe Group, type: :model do
    it "returns false if not valid" do
      u = Group.new
      expect(u.save).to eql(false)
    end

    it "returns true if valid entry" do
      u = Group.create(name: "Life")
      expect(u.name).to eql("Life")
    end
    
    it "should have many projects" do
      t = Group.reflect_on_association(:projects).macro
      expect(t).to eq(:has_many)
    end

    it "should belong to a user" do
      t = Group.reflect_on_association(:user).macro
      expect(t).to eq(:belongs_to)
    end
end