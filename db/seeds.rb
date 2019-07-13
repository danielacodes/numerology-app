require 'faker'

(1..40).each do |i|
  Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthday: Faker::Date.birthday(18,80))
end
