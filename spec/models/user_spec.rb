require 'rails_helper'

RSpec.describe User, type: :model do
  describe "factory" do
    context "Normal" do
      it "be valid" do
        user = build(:user)
        expect(user).to be_valid
      end
    end
  end

  describe "validations" do
    context "no email" do
      it {expect(build(:user, email: nil)).to be_invalid}
    end

    context "no name" do
      it {expect(build(:user, name: nil)).to be_invalid}
    end

    context "no registration" do
      it {expect(build(:user, registration: nil)).to be_invalid}
    end

    context "no password" do
      it {expect(build(:user, password: nil)).to be_invalid}
    end
  end
end
