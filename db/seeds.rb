# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cavaliers = Team.create!(name: "Cavaliers", conference: "east")
Player.create!(name: "LeBron James", team: cavaliers)
Player.create!(name: "Kyrie Irving", team: cavaliers)
Player.create!(name: "Channing Frye", team: cavaliers)
Player.create!(name: "Richard Jefferson", team: cavaliers)
Player.create!(name: "Kyle Korver", team: cavaliers)
Player.create!(name: "Kevin Love", team: cavaliers)
Player.create!(name: "Iman Shumpert", team: cavaliers)
Player.create!(name: "JR Smith", team: cavaliers)
Player.create!(name: "Tristan Thompson", team: cavaliers)
Player.create!(name: "Deron Williams", team: cavaliers)

warriors = Team.create!(name: "Warriors", conference: "east")
Player.create!(name: "Matt Barnes", team: warriors)
Player.create!(name: "Stephen Curry", team: warriors)
Player.create!(name: "Kevin Durant", team: warriors)
Player.create!(name: "Draymond Green", team: warriors)
Player.create!(name: "Andre Iguadala", team: warriors)
Player.create!(name: "Shaun Livingston", team: warriors)
Player.create!(name: "JaVale McGee", team: warriors)
Player.create!(name: "Klay Thompson", team: warriors)

serie1 = Serie.create!(team_a: cavaliers, team_b: warriors)
7.times do
  Match.create!(serie: serie1)
end
