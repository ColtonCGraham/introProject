require 'csv'
require 'faker'

Team.destroy_all
Sport.destroy_all
Player.destroy_all
Match.destroy_all
Location.destroy_all

csv_file = Rails.root.join('db/teams.csv')
csv_data = File.read(csv_file)

team_names = CSV.parse(csv_data, headers: true)

# If CSV was created by Excel in Windows you may also need to set an encoding type:
# products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

team_names.each do |team|
  spo = Sport.find_or_create_by(name: team_names['Sport'])
  Team.create!(name: team['Team Name'],
               sport: spo)
end

Team.all.each do |t|
  3.times do
    n = [Faker::Name.first_name, Faker::Name.last_name].join(' ')
    player = Player.find_or_create_by(name: n)
    t.players << player
  end
end
