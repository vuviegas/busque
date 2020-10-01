class Company < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :travel_lines, dependent: :destroy

  validates :company_name, :user_id, presence: true
end
