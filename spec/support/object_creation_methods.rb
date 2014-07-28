def create_user(overrides = {})
  User.create!({
                 name: 'Some User',
                 email: 'user@example.com',
                 password: 'password',
                 password_confirmation: 'password'
               }.merge(overrides))
end

def create_person(overrides = {})
  Person.create!({
                   title: "Mrs.",
                   first_name: "Rachel",
                   last_name: "Example",
                 }.merge(overrides))
end