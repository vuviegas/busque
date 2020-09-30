class Company < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :company_name, :user_id, presence: true
end
