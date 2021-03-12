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
end
