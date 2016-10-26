class Competitor < ActiveRecord::Base
  has_many :wins, class_name: "Match", foreign_key: "winner_id"
  has_many :losses, class_name: "Match", foreign_key: "loser_id"


  def matches
    Match.where("competitor1_id = ? OR competitor2_id = ?", self.id, self.id)
  end

end
