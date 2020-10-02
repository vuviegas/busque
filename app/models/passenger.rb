class Passenger < ApplicationRecord
  # REGEX = /\A[a-zA-Z]+\z/
  # REGEX_2 = /[0-9]+#$/

  has_many :passenger_trips
  has_many :bus_travel, through: :passenger_trips

  validates :full_name, :date_of_birth, :gender, :cpf, :identification_number, :identification_state, presence: true
  validates :date_of_birth, timeliness: { on_or_before: lambda { Date.current }, type: :date }
  validates :gender, inclusion: { in: ["feminino", "masculino", "não informado"],
                  message: "%{value} não é uma opção válida" }
  validates :cpf, length: { is: 11 }
                    # message: "%{value} deve ter 11 caracteres" }
  # validates :cpf, :identification_number, format: { with: REGEX_2, message: "%{value} deve ter apenas números" }
  validates :identification_state, length: { is: 2 }
                  # message: "%{value} deve ser a sigla do estado" }
  # validates :identification_state, format: { with: REGEX, message: "%{value} deve ter apenas letras" }
end
