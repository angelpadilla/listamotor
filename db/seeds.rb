# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
	name: "Angel Padilla", 
	email: "angelpadillam@gmail.com", 
	role: "super", 
	password: "19891001aaa", 
	password_confirmation: "19891001aaa",
	confirmation_sent_at: "2015-08-11 03:47:15",
	confirmed_at: "2015-08-11 03:51:41",
)

states = State.create([
	{title: 'Aguascalientes'},
	{title: 'Baja California'},
	{title: 'Baja California Sur'},
	{title: 'Campeche'},
	{title: 'Coahuila'},
	{title: 'Colima'},
	{title: 'Chiapas'},
	{title: 'Chihuahua'},
	{title: 'Distrito Federal'},
	{title: 'Durango'},
	{title: 'Guanajuato'},
	{title: 'Guerrero'},
	{title: 'Hidalgo'},
	{title: 'Jalisco'},
	{title: 'México'},
	{title: 'Michoacan'},
	{title: 'Morelos'},
	{title: 'Nayarit'},
	{title: 'Nuevo León'},
	{title: 'Oaxaca'},
	{title: 'Puebla'},
	{title: 'Querétaro'},
	{title: 'Quintana Roo'},
	{title: 'San Luis Potosí'},
	{title: 'Sinaloa'},
	{title: 'Sonora'},
	{title: 'Tabasco'},
	{title: 'Tamaulipas'},
	{title: 'Tlaxcala'},
	{title: 'Veracruz'},
	{title: 'Yucatán'},
	{title: 'Zacatecas'}
	])	

brands = Brand.create([
		{title: 'Acura'},
		{title: 'Alfa Romeo'},
		{title: 'Aston Martin'},
		{title: 'Audi'},
		{title: 'Bentley'},
		{title: 'BMW'},
		{title: 'Bugatti'},
		{title: 'Buick'},
		{title: 'Cadillac'},
		{title: 'Chevrolet'},
		{title: 'Chrysler'},
		{title: 'Citroen'},
		{title: 'Dodge'},
		{title: 'Ferrari'},
		{title: 'Fiat'},
		{title: 'Ford'},
		{title: 'Geely'},
		{title: 'General Motors'},
		{title: 'GMC'},
		{title: 'Honda'},
		{title: 'Hyundai'},
		{title: 'Infiniti'},
		{title: 'Jaguar'},
		{title: 'Jeep'},
		{title: 'Kia Motors'},
		{title: 'Koenigsegg'},
		{title: 'Lamborghini'},
		{title: 'Land Rover'},
		{title: 'Lexus'},
		{title: 'Maserati'},
		{title: 'Mazda'},
		{title: 'McLaren'},
		{title: 'Mercedes Benz'},
		{title: 'Mitsubishi'},
		{title: 'Nissan'},
		{title: 'Pagani'},
		{title: 'Peugeot'},
		{title: 'Porsche'},
		{title: 'Ram'},
		{title: 'Renault'},
		{title: 'Rolls Royce'},
		{title: 'Raab'},
		{title: 'Subaru'},
		{title: 'Suzuki'},
		{title: 'Tata Motors'},
		{title: 'Tesla'},
		{title: 'Toyota'},
		{title: 'Volkswagen'},
		{title: 'Volvo'},
		{title: 'Otro'}
	])





