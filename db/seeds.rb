# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Player.delete_all
# Team.delete_all
# Match.delete_all
# Serie.delete_all

# East Teams

cavaliers = Team.create!(name: "Cavaliers", conference: "east")
wizards = Team.create!(name: "Wizards", conference: "east")
celtics = Team.create!(name: "Celtics", conference: "east")
raptors = Team.create!(name: "Raptors", conference: "east")
sixiers = Team.create!(name: "Sixiers", conference: "east")
pacers = Team.create!(name: "Pacers", conference: "east")
heat = Team.create!(name: "Heat", conference: "east")
bucks = Team.create!(name: "Bucks", conference: "east")

# West Teams

warriors = Team.create!(name: "Warriors", conference: "west")
spurs = Team.create!(name: "Spurs", conference: "west")
rockets = Team.create!(name: "Rockets", conference: "west")
jazz = Team.create!(name: "Jazz", conference: "west")
pelicans = Team.create!(name: "Pelicans", conference: "west")
blazers = Team.create!(name: "Blazers", conference: "west")
thunder = Team.create!(name: "Thunder", conference: "west")
timberwolves = Team.create!(name: "Timberwolves", conference: "west")

# East Series

Serie.create!(team_a: raptors, team_b: wizards, round: "quarter")
Serie.create!(team_a: celtics, team_b: bucks, round: "quarter")
Serie.create!(team_a: sixiers, team_b: heat, round: "quarter")
Serie.create!(team_a: cavaliers, team_b: pacers, round: "quarter")

# West Series

Serie.create!(team_a: rockets, team_b: timberwolves, round: "quarter")
Serie.create!(team_a: warriors, team_b: spurs, round: "quarter")
Serie.create!(team_a: blazers, team_b: pelicans, round: "quarter")
Serie.create!(team_a: thunder, team_b: jazz, round: "quarter")
