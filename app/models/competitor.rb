class Competitor < ActiveRecord::Base
  attr_accessor :time_frame


  has_many :wins, class_name: "Match", foreign_key: "winner_id"
  has_many :losses, class_name: "Match", foreign_key: "loser_id"

  validates_presence_of :name

  def self.all_standings
    Competitor.all.to_a.sort_by(&:wincount).reverse
  end

  def self.week_standings
    Match.last_week_competitors.sort_by(&:wincount).reverse
  end

  def self.season_standings
    Match.this_season_competitors.sort_by(&:wincount).reverse
  end

  def self.month_standings
    Match.last_months_competitors.sort_by(&:wincount).reverse
  end

  def matches
    Match.where("competitor1_id = ? OR competitor2_id = ?", self.id, self.id)
  end

  def winpercent
    if self.losscount == 0
      return '100%'
    else
      return ((self.wincount.to_f / (self.wincount.to_f + self.losscount.to_f)) * 100).to_i.to_s + "%"
    end
  end

  def winloss
    return "#{self.wincount}/#{self.losscount}"
  end

  def wincount
    if @time_frame == "week"
      self.wins.where(:start_time => 7.days.ago..Time.now).count
    elsif @time_frame == "all"
      self.wins.count
    elsif @time_frame == "month"
      self.wins.where(:start_time => 1.month.ago..Time.now).count
    else
      self.wins.where(:season => Match.current_season).count
    end
  end

  def losscount
    if @time_frame == "week"
      self.losses.where(:start_time => 7.days.ago..Time.now).count
    elsif @time_frame == "all"
      self.losses.count
    elsif @time_frame == "month"
      self.losses.where(:start_time => 1.month.ago..Time.now).count
    else
      self.losses.where(:season => Match.current_season).count
    end
  end

  def rank
    if @time_frame == "week"
      Competitor.week_standings.index(self) + 1
    elsif @time_frame == "all"
      Competitor.all_standings.index(self) + 1
    elsif @time_frame == "month"
      Competitor.month_standings.index(self) + 1
    else
      Competitor.season_standings.index(self) + 1
    end
  end

end
