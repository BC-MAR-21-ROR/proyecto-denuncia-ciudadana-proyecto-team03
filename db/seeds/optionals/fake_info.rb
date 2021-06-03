# frozen_string_literal: true

puts 'Generating fake data...'

50.times do |number|
  if number == 0
    puts 'Generating admin user admin@email.com with password 123456...'
    user = User.create!(username: 'Admin user',
                         email: 'admin@email.com',
                         password: '123456',
                         confirmed_at: DateTime.now,
                         user_type: 'administrator')

    Settlement.all.each do |settlement|
      InterestPlace.create!(settlement_id: settlement.id, postal_id: settlement.postal.id, user_id: user.id)
    end
  else
    puts 'Generating user...'
    username = Faker::Name.unique.first_name
    email = Faker::Internet.unique.email
    user = User.create!(username: username, email: email, password: '123456', confirmed_at: DateTime.now)

    Settlement.limit(20).each do |settlement|
      InterestPlace.create!(settlement_id: settlement.id, postal_id: settlement.postal.id, user_id: user.id)
    end
  end

  puts 'Generating complaints for user...'
  10.times do
    category = Category.find(Category.ids.sample)
    category_id = category.id

    date_of_events = Faker::Date.between(from: 4.years.ago, to: Date.today)

    state = State.find(State.ids.sample)
    state_id = state.id

    municipality = state.municipalities.find(state.municipalities.ids.sample)
    municipality_id = municipality.id

    postal = municipality.postals.find(municipality.postals.ids.sample)
    postal_id = postal.id

    settlement = postal.settlements.find(postal.settlements.ids.sample)
    settlement_id = settlement.id

    street = Faker::Address.street_name
    number = Faker::Address.secondary_address

    title = "#{category.name} en la colonia #{settlement.name}"
    description = Faker::Quote.matz

    Complaint.create!(user_id: user.id,
                      category_id: category_id,
                      date_of_events: date_of_events,
                      state_id: state_id,
                      municipality_id: municipality_id,
                      postal_id: postal_id,
                      settlement_id: settlement_id,
                      street: street,
                      number: number,
                      title: title,
                      description: description)
  end
end
