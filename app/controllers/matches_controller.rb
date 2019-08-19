class MatchesController < ApplicationController
  before_action :set_match, only: [:update, :show, :destroy]
  before_action :set_matches, only: [:index, :destroy]

  # GET /matches
  def index
    render json: @matches
  end

  # GET /matches/1
  def show
    render json: {:match=>@match}
  end

  # POST /matches
  def create
    @match = Match.new(team1: params[:team1], team2: params[:team2], team1_wins: 0, team2_wins: 0)

    if @match.save
      render json: @match, status: :created, location: match_url(@match)
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @match.update(match_params)
      render json: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matches/1
  def destroy
    if @match.destroy
      render json: @matches
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def set_matches
    @matches = Match.all
  end

  # Only allow a trusted parameter "white list" through.
  def match_params
    params.permit(:team1, :team2, :team1_wins, :team2_wins)
  end
end
