
# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name "Michael Hartl"
  user.email "mhartl@example.com"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.define :participant do |participant|
  participant.first_name "Joe"
  participant.last_name "Smith"
  participant.date_of_birth Date.parse("2000-05-20")
end

Factory.define :registration do |registration|
  registration.participant Factory(:participant)
  #registration.season_id Season.first().id
end