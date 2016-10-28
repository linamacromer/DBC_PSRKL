class Match < ActiveRecord::Base
  belongs_to :competitor1, class_name: "Competitor"
  belongs_to :competitor2, class_name: "Competitor"
  belongs_to :winner, class_name: "Competitor"
  belongs_to :loser, class_name: "Competitor"

  validates_presence_of :competitor1, :competitor2, :start_time, :season, :location
  validate :unique_day

  def competitors
    [self.competitor1, self.competitor2]
  end

  def self.current_season
    1
  end

  def self.last_week
    self.where('start_time >= ?', 1.week.ago)
  end

  def self.this_season
    self.where('season = ?', self.current_season)
  end

  def self.last_month
    self.where('start_time >= ?', 1.month.ago)
  end

  def self.last_week_competitors
    self.last_week.map{|x|x.competitors}.flatten.uniq
  end

  def self.this_season_competitors
    self.this_season.map{|x|x.competitors}.flatten.uniq
  end

  def self.last_months_competitors
    self.last_month.map{|x|x.competitors}.flatten.uniq
  end

  def unique_day
    if Match.all.where("DATE(start_time) = ?", self.start_time).count > 0
      errors.add(:start_time, "Match already exists for #{self.start_time}")
    end
  end

end
