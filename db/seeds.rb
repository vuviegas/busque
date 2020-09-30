
user_admin_1 = User.create!(email: "vinicius@busque.com", password: "123456", role: "admin")
user_admin_2 = User.create!(email: "ricardo@busque.com", password: "123456", role: "admin")
user_admin_3 = User.create!(email: "umberto@busque.com", password: "123456", role: "admin")


user_clerk_1 = User.create!(email: "pedro@busque.com", password: "123456", role: "clerk")
user_clerk_2 = User.create!(email: "paulo@busque.com", password: "123456", role: "clerk")
user_clerk_3 = User.create!(email: "tiago@busque.com", password: "123456", role: "clerk")

user_police_1 = User.create!(email: "mayssaa@busque.com", password: "123456", role: "police")
user_police_2 = User.create!(email: "mariana@busque.com", password: "123456", role: "police")
user_police_3 = User.create!(email: "sabrina@busque.com", password: "123456", role: "police")

amaz = Company.new!(company_name: "Amazontour" user_id: user_clerk_1)
sant = Company.new!(company_name: "Santanense" user_id: user_clerk_2)
amap = Company.new!(company_name: "Amapatour" user_id: user_clerk_3)

# amaz_100 = Travel_line.new!(identification_number: "100", origin: "Macapá", destinaton: "Laranjal do jari", departure_at: "08:00", arrival_at: "12:30", company_id: "amaz")
# amaz_110 = Travel_line.new!(identification_number: "110", origin: "Laranjal do jari", destinaton: "Macapá", departure_at: "14:00", arrival_at: "18:30", company_id: "amaz")
# amaz_120 = Travel_line.new!(identification_number: "120", origin: "Macapá", destinaton: "Oiapoque", departure_at: "00:01" , arrival_at: "08:00", company_id: "amaz")
# amaz_130 = Travel_line.new!(identification_number: "120", origin: "Oiapoque", destinaton: "Macapá", departure_at: "10:00", arrival_at: "18:00", company_id: "amaz")

# sant_200 = Travel_line.new!(identification_number: "200", origin: "Macapá", destinaton: "Pedra Branca", departure_at: "09:00", arrival_at: "13:00", company_id: "sant")
# sant_210  = Travel_line.new!(identification_number: "210", origin: "Pedra Branca", destinaton: "Macapá", departure_at: "15:00", arrival_at: "19:00", company_id: "sant")
# sant_220  = Travel_line.new!(identification_number: "220", origin: "Macapá", destinaton: "Santana", departure_at: "07:00", arrival_at: "07:30", company_id: "sant")
# sant_230  = Travel_line.new!(identification_number: "220", origin: "Santana", destinaton: "Macapá", departure_at: "16:00", arrival_at: "16:30", company_id: "sant")

# amap_300 = Travel_line.new!(identification_number: "300", origin: "Macapá", destinaton: "Serra do Navio", departure_at: "10:30", arrival_at: "15:30", company_id: "amap")
# amap_310 = Travel_line.new!(identification_number: "310", origin: "Serra do Navio", destinaton: "Macapá", departure_at: "18:30", arrival_at: "23:30", company_id: "amap")
# amap_320 = Travel_line.new!(identification_number: "320", origin: "Macapá", destinaton: "Porto Grande", departure_at: "07:30", arrival_at: "09:00", company_id: "amap")
# amap_330 = Travel_line.new!(identification_number: "320", origin: "Porto Grande", destinaton: "Macapá", departure_at: "11:00", arrival_at: "13:30", company_id: "amap")


# 30.times do |i|

#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[0].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[1].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[2].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[3].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[4].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[5].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[6].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[7].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[8].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[9].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[10].id)
#   bus_travel = Bus_travel.new!(departure_on: Date.today + i.days, arrival_on: Date.today + i.days, travel_line_id: Travel_line[11].id)

# end
