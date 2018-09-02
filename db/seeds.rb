User.create!(name:  "Example User",
             email: "example@review.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activate: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@review.com"
  password = "foobar"
  image = Faker::Avatar.image
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               image: image,
               activate: true)
end
