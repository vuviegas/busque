require 'faker'
require "cpf_cnpj"

User.destroy_all
Company.destroy_all
TravelLine.destroy_all
BusTravel.destroy_all
PassengerTrip.destroy_all
Passenger.destroy_all
Alert.destroy_all

admin1 = User.create!(name: "Vinicius", email: "vinicius@busque.com", password: "123456", role: "admin")
admin2 = User.create!(name: "Ricardo", email: "ricardo@busque.com", password: "123456", role: "admin")
admin3 = User.create!(name: "Umberto", email: "umberto@busque.com", password: "123456", role: "admin")


clerk1 = User.create!(name: "Pedro", email: "pedro@busque.com", password: "123456", role: "clerk")
clerk2 = User.create!(name: "Paulo", email: "paulo@busque.com", password: "123456", role: "clerk")
clerk3 = User.create!(name: "Tiago", email: "tiago@busque.com", password: "123456", role: "clerk")

police1 = User.create!(name: "Mayssaa", email: "mayssaa@busque.com", password: "123456", role: "police")
police2 = User.create!(name: "Mariana", email: "mariana@busque.com", password: "123456", role: "police")
police3 = User.create!(name: "Sabrina", email: "sabrina@busque.com", password: "123456", role: "police")

amaz = Company.create!(company_name: "Amazontour", user: clerk1)
oiap = Company.create!(company_name: "Viação Oiapoque", user: clerk1)
sant = Company.create!(company_name: "Santanense", user: clerk2)
arag = Company.create!(company_name: "Araguari", user: clerk2)
amap = Company.create!(company_name: "Amapatour", user: clerk3)
jari = Company.create!(company_name: "Jari Log", user: clerk3)

amaz_100 = TravelLine.create!(identification_number: "100", origin: "Macapá", destination: "Laranjal do Jari", departure_at: "08:00", arrival_at: "12:30", company: amaz)
amaz_110 = TravelLine.create!(identification_number: "110", origin: "Laranjal do Jari", destination: "Macapá", departure_at: "14:00", arrival_at: "18:30", company: amaz)
amaz_120 = TravelLine.create!(identification_number: "120", origin: "Macapá", destination: "Oiapoque", departure_at: "00:01" , arrival_at: "08:00", company: amaz)
amaz_130 = TravelLine.create!(identification_number: "130", origin: "Oiapoque", destination: "Macapá", departure_at: "10:00", arrival_at: "18:00", company: amaz)

sant_200 = TravelLine.create!(identification_number: "200", origin: "Macapá", destination: "Serra do Navio", departure_at: "09:00", arrival_at: "13:00", company: sant)
sant_210  = TravelLine.create!(identification_number: "210", origin: "Serra do Navio", destination: "Macapá", departure_at: "15:00", arrival_at: "19:00", company: sant)
sant_220  = TravelLine.create!(identification_number: "220", origin: "Macapá", destination: "Tartarugalzinho", departure_at: "07:00", arrival_at: "07:30", company: sant)
sant_230  = TravelLine.create!(identification_number: "230", origin: "Tartarugalzinho", destination: "Macapá", departure_at: "16:00", arrival_at: "16:30", company: sant)

amap_300 = TravelLine.create!(identification_number: "300", origin: "Macapá", destination: "Serra do Navio", departure_at: "10:30", arrival_at: "15:30", company: amap)
amap_310 = TravelLine.create!(identification_number: "310", origin: "Serra do Navio", destination: "Macapá", departure_at: "18:30", arrival_at: "23:30", company: amap)
amap_320 = TravelLine.create!(identification_number: "320", origin: "Macapá", destination: "Calçoene", departure_at: "07:30", arrival_at: "09:00", company: amap)
amap_330 = TravelLine.create!(identification_number: "330", origin: "Calçoene", destination: "Macapá", departure_at: "11:00", arrival_at: "13:30", company: amap)

oiap_400 = TravelLine.create!(identification_number: "400", origin: "Macapá", destination: "Laranjal do Jari", departure_at: "08:00", arrival_at: "12:30", company: oiap)
oiap_410 = TravelLine.create!(identification_number: "410", origin: "Laranjal do Jari", destination: "Macapá", departure_at: "14:00", arrival_at: "18:30", company: oiap)
oiap_420 = TravelLine.create!(identification_number: "420", origin: "Macapá", destination: "Oiapoque", departure_at: "00:01" , arrival_at: "08:00", company: oiap)
oiap_430 = TravelLine.create!(identification_number: "430", origin: "Oiapoque", destination: "Macapá", departure_at: "10:00", arrival_at: "18:00", company: oiap)

arag_500 = TravelLine.create!(identification_number: "500", origin: "Macapá", destination: "Laranjal do Jari", departure_at: "08:00", arrival_at: "12:30", company: arag)
arag_510 = TravelLine.create!(identification_number: "510", origin: "Laranjal do Jari", destination: "Macapá", departure_at: "14:00", arrival_at: "18:30", company: arag)
arag_520 = TravelLine.create!(identification_number: "520", origin: "Macapá", destination: "Oiapoque", departure_at: "00:01" , arrival_at: "08:00", company: arag)
arag_530 = TravelLine.create!(identification_number: "530", origin: "Oiapoque", destination: "Macapá", departure_at: "10:00", arrival_at: "18:00", company: arag)

jari_600 = TravelLine.create!(identification_number: "600", origin: "Macapá", destination: "Laranjal do Jari", departure_at: "08:00", arrival_at: "12:30", company: jari)
jari_610 = TravelLine.create!(identification_number: "610", origin: "Laranjal do Jari", destination: "Macapá", departure_at: "14:00", arrival_at: "18:30", company: jari)
jari_620 = TravelLine.create!(identification_number: "620", origin: "Macapá", destination: "Oiapoque", departure_at: "00:01" , arrival_at: "08:00", company: jari)
jari_630 = TravelLine.create!(identification_number: "630", origin: "Oiapoque", destination: "Macapá", departure_at: "10:00", arrival_at: "18:00", company: jari)

travel_lines = TravelLine.all

7.times do |i|
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[1 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[2 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[3 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[4 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[5 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[6 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[7 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[8 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[9 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[10 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[11 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[12 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[13 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[14 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[15 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[16 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[17 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[18 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[19 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[20 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[21 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[22 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[23 - 1])
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: travel_lines[24 - 1])
end

bus_travels = BusTravel.all


840.times do | passanger |
  passenger = Passenger.create!(full_name: Faker::Name.name_with_middle,
    date_of_birth: Faker::Date.birthday,
    gender: ["Feminino", "Masculino", "Não Informado"].sample,
    cpf: CPF.generate,
    identification_number: Faker::IDNumber.brazilian_id(formatted: false),
    identification_state: %w[AC AL AP AM BA CE ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO DF].sample)
end
    # photo: [
    #   "https://images.unsplash.com/photo-1593614202631-c29a06abba1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    #   "https://images.unsplash.com/photo-1592124549776-a7f0cc973b24?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1601070582672-52888eb40aff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80",
    #   "https://images.unsplash.com/photo-1601165517009-9db2797f132b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1584013077688-e7085b3354c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1585936302523-3b4563e2cd3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1600481176431-47ad2ab2745d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1600542379586-a8401d1799d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    #   "https://images.unsplash.com/photo-1600443568870-ca3d221a5a1c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80",
    #   "https://images.unsplash.com/photo-1598728637989-9c5de7532584?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1598627446792-5d89ab3e3540?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=676&q=80",
    #   "https://images.unsplash.com/photo-1584999734482-0361aecad844?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80",
    #   "https://images.unsplash.com/photo-1554384645-13eab165c24b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
    #   "https://images.unsplash.com/photo-1546672741-d327539d5f13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1560787313-5dff3307e257?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1600364768707-1385e68a48f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80",
    #   "https://images.unsplash.com/photo-1578232443464-16a2880948fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=652&q=80",
    #   "https://images.unsplash.com/photo-1580781545646-895329a2c749?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1546672657-366775449156?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    #   "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    # ].sample

passengers = Passenger.all

840.times do |i|
  passenger_trip = PassengerTrip.create!(bus_travel_id: rand(1..168), passenger_id: (i + 1), arrival_spot: ['Serra do Navio', 'Macapá', 'Pedra Branca do Amapari', 'Laranjal do Jari', 'Porto Grande', 'Calçoene'].sample, seat: rand(1..48))
end
