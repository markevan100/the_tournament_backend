class GamesController < ApplicationController
  before_action :set_game, only: [:update, :show, :destroy]
  before_action :set_games, only: [:index, :destroy]

  # GET /games
  def index
    render json: @games
  end

  # GET /games/1
  def show
    render json: {:game=>@game}
  end

  # POST /games
  def create
    # Check that the teams exist and create the game if they do
    if Team.find(params[:team1]) && Team.find(params[:team2])
      @game = Game.new(team1: params[:team1], team2: params[:team2],
        team1_points: params[:team1_points], team2_points: params[:team2_points])
    end

    # Update games and matches
    Winner.update_teams_and_matches(params[:team1].to_i, params[:team2].to_i,
      params[:team1_points].to_i, params[:team2_points].to_i)

    # Save the game
    if @game.save
      render json: @game, status: :created, location: game_url(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    if @game.destroy
      render json: @games
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_games
    @games = Game.all
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.permit(:team1, :team2, :team1_points, :team2_points)
  end
end
