class User < ApplicationRecord
  has_many :lab_reports, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
end
