require 'faker'

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

sant_200 = TravelLine.create!(identification_number: "200", origin: "Macapá", destination: "Pedra Branca", departure_at: "09:00", arrival_at: "13:00", company: sant)
sant_210 = TravelLine.create!(identification_number: "210", origin: "Pedra Branca", destination: "Macapá", departure_at: "15:00", arrival_at: "19:00", company: sant)
sant_220 = TravelLine.create!(identification_number: "220", origin: "Macapá", destination: "Santana", departure_at: "07:00", arrival_at: "07:30", company: sant)
sant_230 = TravelLine.create!(identification_number: "230", origin: "Santana", destination: "Macapá", departure_at: "16:00", arrival_at: "16:30", company: sant)

amap_300 = TravelLine.create!(identification_number: "300", origin: "Macapá", destination: "Serra do Navio", departure_at: "10:30", arrival_at: "15:30", company: amap)
amap_310 = TravelLine.create!(identification_number: "310", origin: "Serra do Navio", destination: "Macapá", departure_at: "18:30", arrival_at: "23:30", company: amap)
amap_320 = TravelLine.create!(identification_number: "320", origin: "Macapá", destination: "Porto Grande", departure_at: "07:30", arrival_at: "09:00", company: amap)
amap_330 = TravelLine.create!(identification_number: "330", origin: "Porto Grande", destination: "Macapá", departure_at: "11:00", arrival_at: "13:30", company: amap)

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
    gender: ["feminino", "masculino", "não informado"].sample,
    cpf: Faker::IDNumber.brazilian_citizen_number(formatted: false),
    identification_number: Faker::IDNumber.brazilian_id(formatted: false),
    identification_state: %w[AC AL AP AM BA CE ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO DF].sample)
end

passengers = Passenger.all

840.times do |i|
  passenger_trip = PassengerTrip.create!(bus_travel_id: rand(1..168), passenger_id: (i + 1), arrival_spot: ['Serra do Navio', 'Macapá', 'Pedra Branca do Amapari', 'Laranjal do Jari', 'Porto Grande', 'Calçoene'].sample, seat: rand(1..48))
end
