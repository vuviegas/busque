
admin1 = User.create!(email: "vinicius@busque.com", password: "123456", role: "admin")
admin2 = User.create!(email: "ricardo@busque.com", password: "123456", role: "admin")
admin3 = User.create!(email: "umberto@busque.com", password: "123456", role: "admin")


clerk1 = User.create!(email: "pedro@busque.com", password: "123456", role: "clerk")
clerk2 = User.create!(email: "paulo@busque.com", password: "123456", role: "clerk")
clerk3 = User.create!(email: "tiago@busque.com", password: "123456", role: "clerk")

police1 = User.create!(email: "mayssaa@busque.com", password: "123456", role: "police")
police2 = User.create!(email: "mariana@busque.com", password: "123456", role: "police")
police3 = User.create!(email: "sabrina@busque.com", password: "123456", role: "police")

amaz = Company.create!(company_name: "Amazontour", user: clerk1)
sant = Company.create!(company_name: "Santanense", user: clerk2)
amap = Company.create!(company_name: "Amapatour", user: clerk3)

amaz_100 = TravelLine.create!(identification_number: "100", origin: "Macapá", destination: "Laranjal do jari", departure_at: "08:00", arrival_at: "12:30", company: amaz)
amaz_110 = TravelLine.create!(identification_number: "110", origin: "Laranjal do jari", destination: "Macapá", departure_at: "14:00", arrival_at: "18:30", company: amaz)
amaz_120 = TravelLine.create!(identification_number: "120", origin: "Macapá", destination: "Oiapoque", departure_at: "00:01" , arrival_at: "08:00", company: amaz)
amaz_130 = TravelLine.create!(identification_number: "130", origin: "Oiapoque", destination: "Macapá", departure_at: "10:00", arrival_at: "18:00", company: amaz)

sant_200 = TravelLine.create!(identification_number: "200", origin: "Macapá", destination: "Pedra Branca", departure_at: "09:00", arrival_at: "13:00", company: sant)
sant_210  = TravelLine.create!(identification_number: "210", origin: "Pedra Branca", destination: "Macapá", departure_at: "15:00", arrival_at: "19:00", company: sant)
sant_220  = TravelLine.create!(identification_number: "220", origin: "Macapá", destination: "Santana", departure_at: "07:00", arrival_at: "07:30", company: sant)
sant_230  = TravelLine.create!(identification_number: "230", origin: "Santana", destination: "Macapá", departure_at: "16:00", arrival_at: "16:30", company: sant)

amap_300 = TravelLine.create!(identification_number: "300", origin: "Macapá", destination: "Serra do Navio", departure_at: "10:30", arrival_at: "15:30", company: amap)
amap_310 = TravelLine.create!(identification_number: "310", origin: "Serra do Navio", destination: "Macapá", departure_at: "18:30", arrival_at: "23:30", company: amap)
amap_320 = TravelLine.create!(identification_number: "320", origin: "Macapá", destination: "Porto Grande", departure_at: "07:30", arrival_at: "09:00", company: amap)
amap_330 = TravelLine.create!(identification_number: "330", origin: "Porto Grande", destination: "Macapá", departure_at: "11:00", arrival_at: "13:30", company: amap)

30.times do |i|
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(1))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(2))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(3))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(4))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(5))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(6))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(7))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(8))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(9))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(10))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(11))
  bus_travel = BusTravel.create!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line: TravelLine.find(12))
end

5.times do | passanger |
  passenger = Passenger.create!(full_name: ,date_of_birth: ,gender: ,cpf: , identification_number: ,identification_state: ,)
end
