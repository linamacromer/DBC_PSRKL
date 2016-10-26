class Match < ActiveRecord::Base
  belongs_to :competitor1, class_name: "Competitor"
  belongs_to :competitor2, class_name: "Competitor"
  belongs_to :winner, class_name: "Competitor"
  belongs_to :loser, class_name: "Competitor"

  validates_presence_of :competitor1, :competitor2, :start_time, :season, :location

  def competitors
    [self.competitor1, self.competitor2]
  end

end
