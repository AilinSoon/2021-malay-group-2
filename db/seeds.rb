User.create!(name: "zak",
             email: "zak@mail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now )

User.create!(name: "zak",
             email: "zak1@mail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: false,
             activated: true,
             activated_at: Time.zone.now )

