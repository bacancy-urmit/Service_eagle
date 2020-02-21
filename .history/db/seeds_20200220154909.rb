# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
admin=User.create(
    firstname:  "urmit",
    lastname: "prajapati",
    username: "owner",
    email: "urmitprajapati1@gmail.com",
    contact: "+91-846 954 0447",
    password: "123456789Hello@",
    password_confirmation: "123456789Hello@",
    admin: true
)
admin.add_role :super_admin
