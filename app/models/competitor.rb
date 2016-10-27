class Competitor < ActiveRecord::Base
  has_many :wins, class_name: "Match", foreign_key: "winner_id"
  has_many :losses, class_name: "Match", foreign_key: "loser_id"

  validates_presence_of :name

  def matches
    Match.where("competitor1_id = ? OR competitor2_id = ?", self.id, self.id)
  end

  def winpercent
    if self.losses.count == 0
      return '100%'
    else
      return ((wincount.to_f / (wincount.to_f + losscount.to_f)) * 100).to_i.to_s + "%"
    end
  end

  def winloss
    return "#{self.wins.count}/#{self.losses.count}"
  end

  def wincount
    self.wins.count
  end

  def losscount
    self.losses.count
  end

  def rank
    Competitor.all.to_a.sort_by(&:wincount).reverse.index(self) + 1
  end

end
