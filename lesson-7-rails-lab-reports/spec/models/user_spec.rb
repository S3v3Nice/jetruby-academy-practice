require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should have_many(:lab_reports).dependent(:nullify) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_most(150) }
  it { should allow_value("user@example.com").for(:email) }
  it { should_not allow_value("invalid-email").for(:email) }

  it { should validate_presence_of(:first_name) }
  it { should validate_length_of(:first_name).is_at_most(100) }

  it { should validate_presence_of(:last_name) }
  it { should validate_length_of(:last_name).is_at_most(100) }

  describe "#full_name" do
    it "returns full name as 'First Last'" do
      user = build(:user, first_name: "John", last_name: "Doe")
      expect(user.full_name).to eq("John Doe")
    end
  end

  describe "invalid creation" do
    it "does not create a user without an email" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it "does not create a user with a duplicate email" do
      create(:user, email: 'unique@example.com')
      user = build(:user, email: 'unique@example.com')
      expect(user).not_to be_valid
    end
  end
end
