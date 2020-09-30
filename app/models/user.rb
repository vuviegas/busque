class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies

  validates :email, :role, presence: true
  validates :role, inclusion: { in: %w(admin clerk police),
                  message: "%{value} não é uma opção válida" }
  validates :email,
            presence: true,
            uniqueness: true,
            length: { maximum: 255 },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            case_sesitive: false

  def admin?
    role == 'admin'
  end

  def clerk?
    role == 'clerk'
  end

  def police?
    role == 'police'
  end
end
