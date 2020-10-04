class Alert < ApplicationRecord
  belongs_to :user
  belongs_to :passenger

  validates :solved, null: false, default: false
  validates :felony, :description, :level, presence: true
  validates :felony, inclusion: { in: ["Tráfico de Drogas",
                                       "Tráfico de Pessoas",
                                       "Tráfico de Armas",
                                       "Contrabando",
                                       "Descaminho",
                                       "Crime Ambiental",
                                       "Outros"] }
  validates :description, length: { minimum: 50 }
  validates :level, inclusion: { in: %w(yellow red) }
end
