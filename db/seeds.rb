# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Create the event disciplines
event_disciplines = EventDiscipline.create([{:name => 'Sprints'},
								   {:name => 'Distance'},
								   {:name => 'Hurdles'},
								   {:name => 'Jumps'},
								   {:name => 'Throws'},
								   {:name => 'Pole Vault'}])

event_disciplines.each do |event_discipline|
	event_discipline.save
end

# Create the uniform sizes
uniform_sizes = UniformSize.create([{:name => 'YS (chest 26-28)', :sort_order => 10},
									{:name => 'YM (chest 28-29', :sort_order => 20},
									{:name => 'YL (chest 30-31)', :sort_order => 30},
									{:name => 'Adult Small', :sort_order => 40},
									{:name => 'Adult Med', :sort_order => 50},
									{:name => 'Adult Large', :sort_order => 60},
									{:name => 'Adult XL', :sort_order => 70}])

uniform_sizes.each do |uniform_size|
	uniform_size.save
end

# Create the shirt sizes
shirt_sizes = ShirtSize.create([{:name => '6 - 8', :sort_order => 10},
								{:name => '10 - 12', :sort_order => 20},
								{:name => '14 - 16', :sort_order => 30},
								{:name => 'Adult Small', :sort_order => 40},
								{:name => 'Adult Med', :sort_order => 50},
								{:name => 'Adult Large', :sort_order => 60},
								{:name => 'Adult XL', :sort_order => 70},
								{:name => 'Adult XXL', :sort_order => 80}])

shirt_sizes.each do |shirt_size|
	shirt_size.save
end

# Create the volunteer interests
vols = VolunteerInterest.create([{:name => 'Athlete Recruiting', :sort_order => 10, :active => true},
								 {:name => 'Athletic Trainer', :sort_order => 20, :active => true},
								 {:name => 'Coaching Assistant', :sort_order => 30, :active => true},
								 {:name => 'College Scholarship Committee', :sort_order => 40, :active => true},
								 {:name => 'Digital Photographer (video / Camera)', :sort_order => 50, :active => true},
								 {:name => 'Fundraising / Donations / Sponsors Committee', :sort_order => 60, :active => true},
								 {:name => 'Parent Liaison Committee', :sort_order => 70, :active => true},
								 {:name => 'Publicity / Communications', :sort_order => 80, :active => true},
								 {:name => 'Registration', :sort_order => 90, :active => true},
								 {:name => 'Social Committee', :sort_order => 100, :active => true},
								 {:name => 'Spirit Item Sales', :sort_order => 110, :active => true},
								 {:name => 'Statistician', :sort_order => 120, :active => true},
								 {:name => 'Team Mom or Dad', :sort_order => 130, :active => true},
								 {:name => 'Tent Transport / Set up', :sort_order => 140, :active => true},
								 {:name => 'Travel Planning', :sort_order => 150, :active => true},
								 {:name => 'Uniform Distribution', :sort_order => 160, :active => true},
								 {:name => 'Web Page Editor / Administration', :sort_order => 170, :active => true},
								 {:name => 'Parent Volunteer Coordinator', :sort_order => 180, :active => true}])
vols.each do |vol|
	vol.save
end

# Create the season types
season_types = SeasonType.create([{:name => 'Track & Field'},
								  {:name => 'Cross Country'}])

season_types.each do |season_type|
	season_type.save
end

# Create the season
season_type = SeasonType.find_by_name('Track & Field') 
seasons = Season.create([{:year => 2011, :season_type_id => season_type.id, :active => true}])

seasons.each do |season|
	season.save
end

# Create the genders
genders = Gender.create([{:name => 'Male'},	{:name => 'Female'}])

genders.each do |gender|
	gender.save
end

male = Gender.find_by_name('Male')
female = Gender.find_by_name('Female')

# Create all of the initial event types
event_types = EventType.create([{:name => 'Sprints'},
								{:name => 'Middle Distance'},
								{:name => 'Distance'},
								{:name => 'Hurdles'},
								{:name => 'Field Events'},
								{:name => 'Relays'},
								{:name => 'Multi-Events'}])

event_types.each do |event_type|
	event_type.save
end

# Create all of the initial event
# Sprint events first
event_type = EventType.find_by_name('Sprints')
events = Event.create([{:name => '100m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 100},
					   {:name => '200m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 110},
					   {:name => '400m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 120},
					   {:name => '100m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 100},
					   {:name => '200m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 110},
					   {:name => '400m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 120}])

events.each do |event|
	event.save
end

# Create all of the initial event
# now Middle Distance events
event_type = EventType.find_by_name('Middle Distance')
events = Event.create([{:name => '800m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 200},
					   {:name => '800m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 200}])

events.each do |event|
	event.save
end

# Create all of the initial event
# now Distance events
event_type = EventType.find_by_name('Distance')
events = Event.create([{:name => '1500m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 300},
					   {:name => '3000m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 310},
					   {:name => 'Race walking', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 320},
					   {:name => '1500m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 300},
					   {:name => '3000m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 310},
					   {:name => 'Race walking', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 320}])

events.each do |event|
	event.save
end

# Create all of the initial event
# now Hurdles events
event_type = EventType.find_by_name('Hurdles')
events = Event.create([{:name => '110m h', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 400},
					   {:name => '200m h', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 410},
					   {:name => '400m h', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 420},
					   {:name => '100m h', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 400},
					   {:name => '200m h', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 410},
					   {:name => '400m h', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 420}])

events.each do |event|
	event.save
end

# Create all of the initial event
# now Field Events
event_type = EventType.find_by_name('Field Events')
events = Event.create([{:name => 'Long Jump', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 500},
					   {:name => 'High Jump', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 510},
					   {:name => 'Triple Jump', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 520},
					   {:name => 'Pole Vault', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 530},
					   {:name => 'Shot Put', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 540},
					   {:name => 'Discus', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 550},
					   {:name => 'Javelin', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 560},
					   {:name => 'Long Jump', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 500},
					   {:name => 'High Jump', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 510},
					   {:name => 'Triple Jump', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 520},
					   {:name => 'Pole Vault', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 530},
					   {:name => 'Shot Put', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 540},
					   {:name => 'Discus', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 550},
					   {:name => 'Javelin', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 560}])

events.each do |event|
	event.save
end

# Create all of the initial event
# now Relays
event_type = EventType.find_by_name('Relays')
events = Event.create([{:name => '4 x 100m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 600},
					   {:name => '4 x 400m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 610},
					   {:name => '4 x 800m', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 620},
					   {:name => '4 x 100m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 600},
					   {:name => '4 x 400m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 610},
					   {:name => '4 x 800m', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 620}])

events.each do |event|
	event.save
end

# Create all of the initial event
# now Multi-Events
event_type = EventType.find_by_name('Multi-Events')
events = Event.create([{:name => 'Triathlon (HJ, Shot, 400)', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 700},
					   {:name => 'Pentathlon (110 h, LJ, Shot, HJ, 1500)', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 710},
					   {:name => 'Dec (400, 100, 110 h, LJ, Shot, HJ, Jav, PV, Disc, 1500)', :gender_id => male.id, :active => true, :event_type_id => event_type.id, :sort_order => 720},
					   {:name => 'Triathlon (HJ, Shot, 200)', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 700},
					   {:name => 'Pentathlon (100 h, LJ, Shot, HJ, 800)', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 710},
					   {:name => 'Heptathlon (200, 100 h, LJ, Shot, HJ, Jav, 800)', :gender_id => female.id, :active => true, :event_type_id => event_type.id, :sort_order => 720}])

events.each do |event|
	event.save
end
