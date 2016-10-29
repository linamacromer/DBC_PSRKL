class Round < ActiveRecord::Base
  has_many :matches
  validates :title, presence: true, uniqueness: true

  @@date = Time.now + 1.day

  def next_round(current_round, next_round_title)
    if round_complete?(current_round)
      top_competitors = winners(current_round)
      generate_round(top_competitors, Round.create!(title:next_round_title))
      @@date += 1.day
    end
  end

  def round_complete?(round)
    round.matches.each do |match|
      return false unless results_posted?(match)
    end
    true
  end

  def winners(round)
    winners = []
    round.matches.each do |match|
      winners << match.winner
    end
  end

  def results_posted?(match)
    match.winner != nil
  end

  def generate_round (top_competitors, round)
    i = 0
    while i < top_competitors.length - 1
      generate_match(top_competitors[i], top_competitors[i + 1], round)
      i +=2
      @@date += 1.day
    end

  end

  def generate_match(comp1, comp2, date, round)
    Match.create!(competitor1: comp1, competitor2: comp2, start_time: date, round: round)
  end
end
