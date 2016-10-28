# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require 'factory_girl_rails'

competitor1 = Competitor.create( :name => "Kerry J. Lawrence" )
competitor2 = Competitor.create( :name => "Sherita T. Johnson" )
competitor3 = Competitor.create( :name => "Anita K. Robertson" )
competitor4 = Competitor.create( :name => "Gail R. Wilhelm" )
competitor5 = Competitor.create( :name => "Noel A. Donaldson" )
competitor6 = Competitor.create( :name => "Lillian R. Rocha" )
competitor7 = Competitor.create( :name => "Tina L. Templeton" )
competitor8 = Competitor.create( :name => "Laurinda L. Richey" )

time1 = DateTime.new(2016,10,5,12,00,00)
time2 = DateTime.new(2016,11,6,12,00,00)
time3 = DateTime.new(2016,12,7,12,00,00)
time4 = DateTime.new(2016,10,30,12,00,00)
time5 = DateTime.new(2016,11,16,12,00,00)
time6 = DateTime.new(2016,12,25,12,00,00)
time7 = DateTime.new(2016,10,28,12,00,00)
time8 = DateTime.new(2016,10,7,12,00,00)
time9 = DateTime.new(2016,10,6,12,00,00)
time10 = DateTime.new(2016,10,7,12,00,00)
time11 = DateTime.new(2016,10,16,12,00,00)
time12 = DateTime.new(2016,10,14,12,00,00)
time13 = DateTime.new(2016,10,22,12,00,00)
time14 = DateTime.new(2016,10,9,12,00,00)

Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor2.id, :start_time => time1, :season => 1, :location => "Basketball Court", :winner_id => competitor1.id, :loser_id => competitor2.id )
Match.create( :competitor1_id => competitor3.id, :competitor2_id => competitor4.id, :start_time => time2, :season => 1, :location => "Basketball Court",:winner_id => competitor4.id, :loser_id => competitor3.id )
Match.create( :competitor1_id => competitor5.id, :competitor2_id => competitor6.id, :start_time => time3, :season => 1, :location => "Basketball Court", :winner_id => competitor5.id, :loser_id => competitor6.id )
Match.create( :competitor1_id => competitor7.id, :competitor2_id => competitor8.id, :start_time => time4, :season => 1, :location => "Basketball Court", :winner_id => competitor8.id, :loser_id => competitor7.id )
Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor6.id, :start_time => time5, :season => 1, :location => "Basketball Court", :winner_id => competitor1.id, :loser_id => competitor6.id )
Match.create( :competitor1_id => competitor6.id, :competitor2_id => competitor8.id, :start_time => time6, :season => 1, :location => "Basketball Court", :winner_id => competitor6.id, :loser_id => competitor8.id )
Match.create( :competitor1_id => competitor6.id, :competitor2_id => competitor2.id, :start_time => time6, :season => 1, :location => "Basketball Court", :winner_id => competitor6.id, :loser_id => competitor2.id )
Match.create( :competitor1_id => competitor7.id, :competitor2_id => competitor2.id, :start_time => time7, :season => 1, :location => "Basketball Court", :winner_id => competitor6.id, :loser_id => competitor2.id )

Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor3.id, :start_time => time8, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor8.id, :start_time => time9, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor5.id, :competitor2_id => competitor7.id, :start_time => time10, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor8.id, :competitor2_id => competitor7.id, :start_time => time11, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor2.id, :start_time => time14, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor2.id, :competitor2_id => competitor3.id, :start_time => time13, :season => 1, :location => "Basketball Court" )
Match.create( :competitor1_id => competitor4.id, :competitor2_id => competitor2.id, :start_time => time12, :season => 1, :location => "Basketball Court" )

