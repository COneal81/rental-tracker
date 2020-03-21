# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
RentalProperty.destroy_all
Tenant.destroy_all
Repair.destroy_all




#User
kevin = User.create(name: "Kevin", email: "k@k.com", password: "test123")
wyatt = User.create(name: "Wyatt", email: "w@w.com", password: "test123")



#Tenant
kari = Tenant.create(renter: "Kari Smith", co_renter: "N/A", address: "210 Cesna Lane Airport, IA 44444", 
renter_email: "K@K.com", co_renter_email: "N/A", renter_cell_phone: "123-456-7890", 
co_renter_cell_phone: "N/A", user_id: wyatt.id)

hudson = Tenant.create(renter: "Hudson Jones", co_renter: "Hunter Jones", address: "2222 One Lane Rd Somewhere, OK 58949", 
renter_email: "hud@hud.com", co_renter_email: "hunt@hunt.com", renter_cell_phone: "234-567-8901", 
co_renter_cell_phone: "567-890-1234", user_id: wyatt.id)

griffin = Tenant.create(renter: "Griffin Williams", co_renter: "Massey Williams", address: "4999 Slick Rd Snow, MN 58588", 
renter_email: "griff@griff.com", co_renter_email: "mass@mass.com", renter_cell_phone: "987-987-9870", 
co_renter_cell_phone: "987-543-2345", user_id: kevin.id)

cj = Tenant.create(renter: "CJ Pony", co_renter: "n/a", address: "4 Pony Rd Snow, NC 58588", 
    renter_email: "cj@gcj.com", co_renter_email: "n/a", renter_cell_phone: "987-987-9870", 
    co_renter_cell_phone: "987-543-2345", user_id: kevin.id)

 

#Rental Property

red_ranch = RentalProperty.create(property_name: "Red Ranch", property_description: "Spacious ranch home with a Texas feel!  
5 Bed/4 Bath!", 
address: "1234 Main St. Countyline, NC 22222", monthly_rental_amount: 1500, 
deposit_amount: 1500, square_feet: 2800, leased: true, contract_start_date: "12/1/19", contract_end_date: "12/1/20", user_id: kevin.id, 
image_url: "https://en.wikipedia.org/wiki/List_of_house_styles#/media/File:HouseII2007.jpg", tenant_id: cj.id)

cape_cod = RentalProperty.create(property_name: "Cape Cod", property_description: "Cute and cozy!  2 Bed ~ 1.5 Bath", 
address: "123 Liberty Rd Liberty, NC 22221", monthly_rental_amount: 800, 
deposit_amount: 800, square_feet: 1500, leased: true, contract_start_date: "N/A", contract_end_date: "N/A", user_id: kevin.id, 
image_url: "https://en.wikipedia.org/wiki/List_of_house_styles#/media/File:Cape_Cod_style_house.jpg", tenant_id: griffin.id)

blue_bungalow = RentalProperty.create(property_name: "Blue Bungalow", property_description: "Front porch living at its best!  
4 Bed ~ 3 
Bath", address: "456 Market St Coffee, NC 22254", monthly_rental_amount: 1100, 
deposit_amount: 1500, square_feet: 2490, leased: true, contract_start_date: "1/1/20", contract_end_date: "2/1/21", user_id: wyatt.id, 
image_url: "https://en.wikipedia.org/wiki/List_of_house_styles#/media/File:Abernathy-Shaw_House_c.1908.jpg", tenant_id: hudson.id)

farm_house = RentalProperty.create(property_name: "Farm House", property_description: "Nestled on 20 acres, this farm house is 
surraounded by whispering pines.  5 Bed ~ 4.5 Bath  Includes a 10 stall horse ban and 5 pastures.", 
address: "7899 Hidden Valley Rd Farmland, NC 22298", monthly_rental_amount: 2600, 
deposit_amount: 3000, square_feet: 3500, leased: true, contract_start_date: "7/7/19", contract_end_date: "7/7/20", user_id: wyatt.id, 
image_url: "https://en.wikipedia.org/wiki/Farm#/media/File:Farming_near_Klingerstown,_Pennsylvania.jpg", tenant_id: kari.id)



#Repair

repair_1 = Repair.create(repair_name: "Lock", repair_needed: true, repair_description: "Broken lock on back door", repair_cost: 50, 
repair_completed: false, rental_property_id: cape_cod.id)

repair_2 = Repair.create(repair_name: "Roof", repair_needed: true, repair_description: "New roof needed around chimney.  Boards 
under roof need cut out and replaced.  Called for estimates.  Going with Pro Roofers,Inc. 345-567-1234 ", repair_cost: 12000, 
repair_completed: true, rental_property_id:farm_house.id)

repair_3 = Repair.create(repair_name: "Paint", repair_needed: true, repair_description: "Outside needs painted", repair_cost: 2800, 
repair_completed: false, rental_property_id: blue_bungalow.id)

repair_4 = Repair.create(repair_name: "Window", repair_needed: true, repair_description: "New window on south side of home.  
Broken by tenant.  Bill tenant", repair_cost: 1000, repair_completed: false, rental_property_id: red_ranch.id)



