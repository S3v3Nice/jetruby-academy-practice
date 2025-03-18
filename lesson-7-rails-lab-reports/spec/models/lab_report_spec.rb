require 'rails_helper'

RSpec.describe LabReport, type: :model do
  let(:user) { create(:user) }

  subject { build(:lab_report, user: user) }

  it { should belong_to(:user).optional }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }

  it { should validate_length_of(:description).is_at_most(500).allow_nil }
  it { should validate_inclusion_of(:grade).in_array(%w[A B C D E FX F]).allow_nil }

  describe "#normalize_blank_values" do
    it "sets description to nil if blank" do
      subject.description = ""
      subject.valid?
      expect(subject.description).to be_nil
    end

    it "sets grade to nil if blank" do
      subject.grade = ""
      subject.valid?
      expect(subject.grade).to be_nil
    end
  end

  describe "invalid creation" do
    it "does not create a lab report without a title" do
      lab_report = build(:lab_report, title: nil)
      expect(lab_report).not_to be_valid
    end

    it "does not create a lab report with an invalid grade" do
      lab_report = build(:lab_report, grade: 'G')
      expect(lab_report).not_to be_valid
    end
  end
end
