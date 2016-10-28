class Round < ActiveRecord::Base
  has_many :matches
  validates :title, presence: true, uniqueness: true
end
