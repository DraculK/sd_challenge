require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "factory" do
    context "Normal" do
      it "be valid" do
        book = build(:book)
        expect(book).to be_valid
      end
    end
  end

  describe "validations" do
    context "no title book" do
      it {expect(build(:book, title: nil)).to be_invalid}
    end

    context "no author book" do
      it {expect(build(:book, author: nil)).to be_invalid}
    end

    context "no year book" do
      it {expect(build(:book, year: nil)).to be_invalid}
    end

    context "no description book" do
      it {expect(build(:book, description: nil)).to be_invalid}
    end
  end
end
