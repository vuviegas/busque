class Alert < ApplicationRecord
  belongs_to :user
  belongs_to :passenger

  validates :solved, presence: true, null: false, default: false
  validates :felony, :description, :level, presence: true
  validates :felony, inclusion: { in: ["Tráfico de Drogas",
                                       "Tráfico de Pessoas",
                                       "Tráfico de Armas",
                                       "Contrabando",
                                       "Descaminho",
                                       "Crime Ambiental",
                                       "outros"] }
  validates :description, length: { minimum: 50 }
  validates :level, inclusion: { in: %w(yellow red) }
end
