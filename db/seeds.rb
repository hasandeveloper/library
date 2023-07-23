# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
    library = Api::V1::Library.create(name: "library_#{i}")
    10.times do
        Api::V1::Book.create(name: "book_name_#{i}", description: "book_description_#{i}", stock: 10, library_id: library.id)
    end
end