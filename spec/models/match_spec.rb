require 'rails_helper'

describe Match, type: :model do
  let(:competitor1) { create(:competitor, name: "Alex")}
  let(:competitor2) { create(:competitor, name: "Jason")}

  let(:match1) { create(:match, competitor1: competitor1, competitor2: competitor2) }

  let(:match_list) { create_list(:match, 3, competitor1: competitor1, competitor2: competitor2, winner: competitor2, loser: competitor1) }

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

  describe "#rank" do
    context "return the position of a competitor in the standings" do


      it "returns position 1 when competitor has the most wins" do
        match_list
        expect(competitor2.rank).to eq(1)
      end

      it "returns position 2 when competitor has the second most wins" do
        match_list
        expect(competitor1.rank).to eq(2)
      end
    end
  end
end
