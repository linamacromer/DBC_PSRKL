require 'rails_helper'

describe Match, type: :model do
  let(:competitor1) { create(:competitor, name: "Alex")}
  let(:competitor2) { create(:competitor, name: "Jason")}

  let(:match1) { create(:match, competitor1: competitor1, competitor2: competitor2) }

  let(:match_list) { create_list(:match, 3, competitor1: competitor1, competitor2: competitor2, winner: competitor2, loser: competitor1) }

  describe "Validations" do
    it 'validates that competitor1 is present' do
      failed_match = build(:match, competitor1: nil)
      failed_match.valid?
      failed_match.errors.messages[:competitor1].should eq ["can't be blank"]
    end

    it 'validates that competitor2 is present' do
      failed_match = build(:match, competitor2: nil)
      failed_match.valid?
      failed_match.errors.messages[:competitor2].should eq ["can't be blank"]
    end

    it 'validates that start_time is present' do
      failed_match = build(:match, start_time: nil)
      failed_match.valid?
      failed_match.errors.messages[:start_time].should eq ["can't be blank"]
    end

    it 'validates that season is present' do
      failed_match = build(:match, season: nil)
      failed_match.valid?
      failed_match.errors.messages[:season].should eq ["can't be blank"]
    end

    it 'validates that location is present' do
      failed_match = build(:match, location: nil)
      failed_match.valid?
      failed_match.errors.messages[:location].should eq ["can't be blank"]
    end

    xit 'validates that the match start time is in the future' do #TODO: add functionality back in
      time = 1.day.ago
      match2 = build(:match, start_time: time)
      match2.valid?
      match2.errors.messages[:start_time].to_s.should include("must be in the future")
    end

    it 'validates that there can only be one match a day' do
      time = match1.start_time
      match2 = build(:match, start_time: time)
      match2.valid?
      match2.errors.messages[:start_time].to_s.should include("match already exists for date")
    end

    it 'validates that competitors are unique' do
      failed_match = build(:match, competitor1: competitor1, competitor2: competitor1)
      failed_match.valid?
      failed_match.errors.messages[:competitor1].should eq ["competitors must be different"]
    end
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
