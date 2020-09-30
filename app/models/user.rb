class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies, dependent: :nullify

  validates :email, :role, presence: true
  validates :role, inclusion: { in: %w(admin clerk police),
                  message: "%{value} não é uma opção válida" }
  validates :email,
    format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: "Formato de e-mail inválido" },
    uniqueness: { case_sensitive: false },
    length: { minimum: 4, maximum: 254 }

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
