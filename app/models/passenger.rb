class Passenger < ApplicationRecord
  has_many :passenger_trips, dependent: :destroy
  has_many :alerts, dependent: :destroy
  has_many :bus_travels, through: :passenger_trips

  # accepts_nested_attributes_for :passenger_trips

  validates :full_name, :date_of_birth, :gender, :cpf, :identification_number, :identification_state, presence: true
  validates :date_of_birth, timeliness: { on_or_before: lambda { Date.current }, type: :date }
  validates :gender, inclusion: { in: ["Feminino", "Masculino", "Não Informado"],
                  message: "%{value} não é uma opção válida" }
  # validates :cpf, length: { is: 11 }

  validates :identification_state, length: { is: 2 }

  include PgSearch::Model
  pg_search_scope :search_global,
    against: [ :full_name, :cpf, :date_of_birth, :gender, :identification_number, :identification_state ],
      using: {
      tsearch: { prefix: true }
    }

  def formatted_cpf
    CPF.new(cpf).formatted
  end
end
