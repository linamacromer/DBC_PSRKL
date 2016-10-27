require 'rails_helper'

describe Competitor, type: :model do
  let(:competitor1) { Competitor.create!(name: "Alex")}
  let(:competitor2) { Competitor.create!(name: "Jason")}
  let(:valid_match) { {
      competitor1: competitor1,
      competitor2: competitor2,
      start_time: Time.now,
      season: 1,
      location: "Basketball Court"
    } }

  let(:match1) { Match.create(valid_match)}

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Associations" do
    it { should have_many(:wins) }
    it { should have_many(:losses) }
  end

  describe '#matches' do
    it "returns an array of matches participated" do
      expect(competitor1.matches).to eq([match1])
    end
  end
end
