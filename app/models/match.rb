class Match < ActiveRecord::Base
  belongs_to :competitor1, class_name: "Competitor"
  belongs_to :competitor2, class_name: "Competitor"

end
