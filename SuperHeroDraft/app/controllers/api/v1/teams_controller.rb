class Api::V1::TeamsController < ApplicationController

  def index
    @teams = Team.all 
    render json: @teams
  end

  def team_id
    request.headers['Authorization']
  end

  def create
    @team = Team.new(team_params)
    @team.save
    
    render json: @team
  end

  # def show
  #   if logged_in
  #     render json: {teamName: current_team.teamName, id: current_team.id}, status: 200
  #   else
  #     render json: {error: 'Token Invalid'}, status: 401
  #   end
  # end

  def team_params
    params.require(:login).permit(:name, :password)

  end


end

# team = Team.find_by(teamName: params[:teamName])
    # if team && team.authenticate(params[:password])
    #   render json: {teamName: team.teamName, id: team.id}, status: 200
    # else
    #   render json: {error: 'Username or Password Invalid'}, status: 401
    # end
