class Winner
  class << self

    def update_teams_and_matches(team1, team2, team1_points, team2_points)
      update_match(team1, team2, team1_points)
      update_team(team1, team2, team1_points, team2_points)
      match_winner(team1, team2)
    end

    private

    def who_won(team1, team2, team1_points)
       team1_points == 21 ? team1 : team2
    end

    def return_the_match(team1, team2)
      match = Match.where(team1: team1).where(team2: team2).or(Match.where(team1: team2).where(team2: team1))
      if !match.present?
        match = [Match.create(team1: team1, team2: team2, team1_wins: 0, team2_wins: 0)]
      end
      return match[0]
    end

    def update_match(team1, team2, team1_points)
      winner = who_won(team1, team2, team1_points)
      match = return_the_match(team1, team2)
      if match.team1 == winner
        match.team1_wins += 1
      else
        match.team2_wins += 1
      end
      match.save
    end

    def match_winner(team1, team2)
      match = Match.where(team1: team1).where(team2: team2).or(Match.where(team1: team2).where(team2: team1))
      match = match[0]
      if match.team1_wins == 4
        first_team = Team.find(team1)
        first_team.matches_played += 1
        first_team.matches_won += 1
        first_team.save
        second_team = Team.find(team2)
        second_team.matches_played += 1
        second_team.matches_lost += 1
        second_team.save
      end

      if match.team2_wins == 4
        first_team = Team.find(team1)
        first_team.matches_played += 1
        first_team.matches_lost += 1
        first_team.save
        second_team = Team.find(team2)
        second_team.matches_played += 1
        second_team.matches_won += 1
        second_team.save
      end
    end


    def update_team(team1, team2, team1_points, team2_points)
      team1 = Team.find(team1)
      team1.point_diff += team1_points
      team1.point_diff -= team2_points
      team1_points == 21 ? team1.games_diff += 1 : team1.games_diff -= 1
      team1.save

      team2 = Team.find(team2)
      team2.point_diff += team2_points
      team2.point_diff -= team1_points
      team2_points == 21 ? team2.games_diff += 1 : team2.games_diff -= 1
      team2.save
    end
  end
end
