class Company < ApplicationRecord
  belongs_to :user
  validates :company_name, :user_id, presence: true
end
