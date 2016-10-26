require 'rails_helper'

describe Match, type: :model do
  let(:competitor1) { Competitor.create!(name: "Alex")}
  let(:competitor2) { Competitor.create!(name: "Jason")}
  let(:valid_match) { {
      competitor1: competitor1,
      competitor2: competitor2,
      start_time: Time.now,
      season: "Season 1",
      location: "Basketball Court"
    } }

  let(:match1) { Match.create(valid_match)}

  describe "Validations" do
    it { should validate_presence_of(:competitor1) }
    it { should validate_presence_of(:competitor2) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:season) }
    it { should validate_presence_of(:location) }
  end

  describe "Associations" do
    it do
      should belong_to(:competitor1)
    end
    it do
      should belong_to(:competitor2)
    end

    it do
      should belong_to(:winner)
    end
    it do
      should belong_to(:loser)
    end
  end

  describe "#competitors" do
    it "returns an array of competitor objects" do
      expect(match1.competitors).to eq([competitor1,competitor2])
    end
  end
end
