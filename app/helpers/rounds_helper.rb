module RoundsHelper
  def create_bracket
   # Return an array of the top 8 competitors
    top_competitors = Competitor.all_standings[0..7]
    round1 = generate_round(top_competitors, Round.create(title: "Quarterfinals"))

   # Return an array of the top 4 competitors
    round2 = next_round(round1, "Semifinals")

  # Return an array of the top 2 competitors
    round3 = next_round(round2, "Finals")
  end
end
