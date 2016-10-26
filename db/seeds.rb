# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

competitor1 = Competitor.create( :name => "Kerry J. Lawrence" )
competitor2 = Competitor.create( :name => "Sherita T. Johnson" )
competitor3 = Competitor.create( :name => "Anita K. Robertson" )
competitor4 = Competitor.create( :name => "Gail R. Wilhelm" )
competitor5 = Competitor.create( :name => "Noel A. Donaldson" )
competitor6 = Competitor.create( :name => "Lillian R. Rocha" )
competitor7 = Competitor.create( :name => "Tina L. Templeton" )
competitor8 = Competitor.create( :name => "Laurinda L. Richey" )

time1 = DateTime.new(2016,10,5,12,00,00)
time2 = DateTime.new(2016,10,6,12,00,00)
time3 = DateTime.new(2016,10,7,12,00,00)
time4 = DateTime.new(2016,10,12,12,00,00)
time5 = DateTime.new(2016,10,16,12,00,00)
time6 = DateTime.new(2016,10,25,12,00,00)

Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor2.id, :start_time => time1, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor3.id, :competitor2_id => competitor4.id, :start_time => time2, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor5.id, :competitor2_id => competitor6.id, :start_time => time3, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor7.id, :competitor2_id => competitor8.id, :start_time => time4, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor6.id, :start_time => time5, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor6.id, :competitor2_id => competitor8.id, :start_time => time6, :season => 1, :location => "Basketball Court" )
