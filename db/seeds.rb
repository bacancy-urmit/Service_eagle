# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
admin=User.new(
    firstname:  "urmit",
    lastname: "prajapati",
    username: "owner",
    email: "urmit1prajapati10@gmail.com",
    contact: "+91-846 954 0447",
    password: "123456789Hello@",
    password_confirmation: "123456789Hello@"
)
admin.add_role :super_admin
admin.save