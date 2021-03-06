class TeamsController < ApplicationController
  def index
    @q = Team.ransack(params[:q])
    @teams = @q.result(:distinct => true).includes(:poets, :participations, :coachings, :coaches).page(params[:page]).per(10)

    render("teams/index.html.erb")
  end

  def show
    @coaching = Coaching.new
    @participation = Participation.new
    @poet = Poet.new
    @team = Team.find(params[:id])

    render("teams/show.html.erb")
  end

  def new
    @team = Team.new

    render("teams/new.html.erb")
  end

  def create
    @team = Team.new

    @team.organization_name = params[:organization_name]
    @team.location = params[:location]

    save_status = @team.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/teams/new", "/create_team"
        redirect_to("/teams")
      else
        redirect_back(:fallback_location => "/", :notice => "Team created successfully.")
      end
    else
      render("teams/new.html.erb")
    end
  end

  def edit
    @team = Team.find(params[:id])

    render("teams/edit.html.erb")
  end

  def update
    @team = Team.find(params[:id])

    @team.organization_name = params[:organization_name]
    @team.location = params[:location]

    save_status = @team.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/teams/#{@team.id}/edit", "/update_team"
        redirect_to("/teams/#{@team.id}", :notice => "Team updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Team updated successfully.")
      end
    else
      render("teams/edit.html.erb")
    end
  end

  def destroy
    @team = Team.find(params[:id])

    @team.destroy

    if URI(request.referer).path == "/teams/#{@team.id}"
      redirect_to("/", :notice => "Team deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Team deleted.")
    end
  end
end
