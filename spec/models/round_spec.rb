require 'rails_helper'

RSpec.describe Round, type: :model do

  let(:round) { Round.new(title: 'semifinals') }

  let(:competitor1) {Competitor.create( :name => "Ariana Grande" )}
  let(:competitor2) {Competitor.create( :name => "Kiara Williams" )}
  let(:match) {Match.create( :competitor1_id => competitor1.id,
    :competitor2_id => competitor2.id,
    :start_time => DateTime.new(2016,10,5,12,00,00),
    :season => 1,
    :location => "Basketball Court",
    :winner_id => competitor1.id,
    :loser_id => competitor2.id)}

  describe 'associations' do
    before(:each) do
      round.save
      match.round = round
    end

    it 'has many matches' do
      expect(round.matches).to all(be_a Match)
    end

  end

  describe 'validations' do
    it 'allows if valid' do
      expect(round.save).to be true
    end

    it 'does not allow if no title' do
      round.title = nil
      expect(round.save).to be false
    end

    it 'does not allow if title is not unique' do
      Round.create(title: "semifinals")
      expect(round.save).to be false
    end

  end
end
