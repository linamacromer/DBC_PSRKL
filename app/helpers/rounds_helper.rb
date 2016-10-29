module RoundsHelper
  def create_bracket
    return false if Round.count > 0
   # Return an array of the top 8 competitors
    top_competitors = Competitor.all_standings[0..7]
    round1 = RoundsController.generate_round(top_competitors, Round.create(title: "Quarterfinals"))

   # Return an array of the top 4 competitors
    round2 = RoundsController.next_round(round1, "Semifinals")

  # Return an array of the top 2 competitors
    round3 = RoundsController.next_round(round2, "Finals")
    true
  end

end
