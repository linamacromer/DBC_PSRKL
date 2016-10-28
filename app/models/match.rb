class Match < ActiveRecord::Base
  belongs_to :competitor1, class_name: "Competitor"
  belongs_to :competitor2, class_name: "Competitor"
  belongs_to :winner, class_name: "Competitor"
  belongs_to :loser, class_name: "Competitor"
  belongs_to :round

  validates_presence_of :competitor1, :competitor2, :start_time, :season, :location
  validate :unique_competitors
  validate :unique_day
  validate :future_date

  def start_time_string
    self.start_time.strftime('%FT%T')
  end

  def start_time_string=(input)
    begin
      self.start_time= input.to_datetime.utc
    rescue
      self.start_time= nil
    end
  end

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
      errors.add(:start_time, "match already exists for date")
    end
  end

  def unique_competitors
    errors.add(:competitor1, "competitors must be different") if competitor1 == competitor2
  end

  def future_date
    if start_time
      if start_time < Date.today
        errors.add(:start_time, "must be in the future")
      end
    end
  end


end
