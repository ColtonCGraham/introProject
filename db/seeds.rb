require 'csv'
require 'faker'

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)
csv_file = Rails.root.join('db/teams.csv')
csv_data = File.read(csv_file)

team_names = CSV.parse(csv_data, headers: true)

csv_file2 = Rails.root.join('db/Community_Centre.csv')
csv_data2 = File.read(csv_file2)
centres = CSV.parse(csv_data2, headers: true)

# If CSV was created by Excel in Windows you may also need to set an encoding type:
# products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

team_names.each do |team|
  spo = Sport.find_or_create_by(name: team['Sport'])
  Team.create!(name: team['Team Name'],
               sport: spo)
end

Team.all.each do |t|
  8.times do
    n = [Faker::Name.first_name, Faker::Name.last_name].join(' ')
    player = Player.find_or_create_by(name: n)
    t.players << player
  end

  2.times do
    r = Player.all.sample
    t.players << r unless t.players.include?(r)
  end
end

30.times do
  c = centres[rand(centres.count)]
  l = Location.find_or_create_by(name: c['Name'], address: c['Address'], coordinates: c['Location 1'])
  s = Sport.all.sample
  t = Team.where(sport: s).order('RANDOM()').limit(2)
  m = Match.create!(sport: s,
                    date: Faker::Date.forward(days: 45),
                    location: l)

  m.teams << t
end
