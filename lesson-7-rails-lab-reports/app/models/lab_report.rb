class LabReport < ApplicationRecord
  belongs_to :user

  validates :title, :description, :grade, presence: true
end
