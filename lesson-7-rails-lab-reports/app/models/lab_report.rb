class LabReport < ApplicationRecord
  belongs_to :user, optional: true

  before_validation :normalize_blank_values

  validates :title, presence: true, length: { maximum: 250 }
  validates :description, allow_nil: true, length: { maximum: 500 }
  validates :grade, allow_nil: true, inclusion: { in: %w[A B C D E FX F] }

  def normalize_blank_values
    self.description = nil if description.blank?
    self.grade = nil if grade.blank?
  end
end
