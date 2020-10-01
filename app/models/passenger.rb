class Passenger < ApplicationRecord

  belongs_to :bus_travel

  validates :full_name, :date_of_birth, :gender, :cpf, :identification_number, :identification_state, presence: true
  validates :date_of_birth, timeliness: { on_or_before: lambda { Date.current }, type: :date }
  validates :gender, inclusion: { in: ["feminino", "masculino", "não informado"],
                  message: "%{value} não é uma opção válida" }
  validates :cpf, lenght: { is: 11 }
                    # message: "%{value} deve ter 11 caracteres" }
  validates :cpf, :identification_number, format: { with: '/0-9]+#$/',
                  message: "%{value} deve ter apenas números" }
  validates :identification_state, lenght: { is: 2 }
                  # message: "%{value} deve ser a sigla do estado" }
  validates :identification_state, format: { with: '/\A[a-zA-Z]+\z/',
                  message: "%{value} deve ter apenas letras" }
end
