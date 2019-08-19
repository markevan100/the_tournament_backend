class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]
  before_action :set_teams, only: [:index, :destroy]

# GET /teams
def index
  render json: @teams
end

# GET /teams/1
def show
  render json: {:team=>@team}
end

# POST /teams
def create
  @team = Team.new(name: params[:name], matches_played: 0, matches_won: 0, matches_lost: 0, games_diff: 0, point_diff: 0)

  if @team.save
    render json: @team, status: :created, location: team_url(@team)
  else
    render json: @team.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /teams/1
def update
  if @team.update(team_params)
    render json: @team
  else
    render json: @team.errors, status: :unprocessable_entity
  end
end

# DELETE /teams/1
def destroy
  if @team.destroy
    render json: @teams
  else
    render json: @team.errors, status: :unprocessable_entity
  end
end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  def set_teams
    @teams = Team.all
  end
  # Only allow a trusted parameter "white list" through.
  def team_params
    params.permit(:name, :matches_played, :matches_won, :matchs_lost, :games_diff, :point_diff)
  end

end
