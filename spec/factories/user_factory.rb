Factory.define :user do |user|
  user.firstname             "Mara"
  user.username              "mara"
  user.email                 "mara@example.com"
  user.password              "secret"
  user.password_confirmation "secret"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :username do |n|
  "mara#{n}"
end