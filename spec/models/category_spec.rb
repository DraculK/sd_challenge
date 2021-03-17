require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "factory" do
    context "Normal" do
      it "be valid" do
        category = build(:category)
        expect(category).to be_valid
      end
    end
  end

  describe "validations" do
    context "no name category" do
      it {expect(build(:category, name: nil)).to be_invalid}
    end
  end
end
