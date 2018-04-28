class SerieStatsController < ApplicationController
  before_action :set_serie_stat, only: [:show, :edit, :update, :destroy]

  # GET /stats
  # GET /stats.json
  def index
    @serie_stats = SerieStat.all
  end

  # GET /stats/1
  # GET /stats/1.json
  def show
  end

  # GET /stats/new
  def new
    @serie_stat = SerieStat.new
  end

  # GET /stats/1/edit
  def edit
  end

  # POST /stats
  # POST /stats.json
  def create
    @serie_stat = SerieStat.new(serie_stat_params)

    respond_to do |format|
      if @serie_stat.save
        format.html { redirect_to @serie_stat, notice: 'Stat was successfully created.' }
        format.json { render :show, status: :created, location: @serie_stat }
      else
        format.html { render :new }
        format.json { render json: @serie_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stats/1
  # PATCH/PUT /stats/1.json
  def update
    team_a_wins = serie_stat_params[:team_a_wins].to_i
    team_b_wins = serie_stat_params[:team_b_wins].to_i

    winner = @serie_stat.team_a if team_a_wins == 4
    winner = @serie_stat.team_b if team_b_wins == 4
    loser_win_games = team_a_wins if team_a_wins < 4
    loser_win_games = team_b_wins if team_b_wins < 4

    update_params = {
      team_a_wins: team_a_wins,
      team_b_wins: team_b_wins,
      winner_id: winner.id,
      loser_win_games: loser_win_games
    }

    respond_to do |format|
      if @serie_stat.update(update_params)
        format.html { redirect_to :dashboard, notice: 'Tu apuesta fue ingresada.' }
        format.json { render :show, status: :ok, location: @serie_stat }
      else
        format.html { redirect_to :dashboard }
        format.json { render json: @serie_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @serie_stat.destroy
    respond_to do |format|
      format.html { redirect_to serie_stats_url, notice: 'Stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serie_stat
      @serie_stat = SerieStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serie_stat_params
      params.fetch(:serie_stat, {}).permit(:winner_id, :loser_win_games, :team_a_wins, :team_b_wins)
    end
end
