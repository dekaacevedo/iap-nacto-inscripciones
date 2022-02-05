# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def intento
  attendants = Attendant.all
  attendees = Attendee.all

  attendants.each do |attendant|
      if Attendee.where(rut: attendant.rut).exists?
        puts "#{attendant.first_name + " " + attendant.last_name} ya ha sido creado anteriormente"
      else  
        Attendee.create!(first_name: attendant.first_name, last_name: attendant.last_name, rut: attendant.rut, phone: attendant.phone)
        puts "Se ha creado a #{attendant.first_name + " " + attendant.last_name} como Attendee"
      end
  end
end

intento
