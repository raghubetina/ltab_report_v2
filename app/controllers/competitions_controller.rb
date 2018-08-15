class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all

    render("competitions/index.html.erb")
  end

  def show
    @participation = Participation.new
    @bout = Bout.new
    @competition = Competition.find(params[:id])

    render("competitions/show.html.erb")
  end

  def new
    @competition = Competition.new

    render("competitions/new.html.erb")
  end

  def create
    @competition = Competition.new

    @competition.name = params[:name]

    save_status = @competition.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/competitions/new", "/create_competition"
        redirect_to("/competitions")
      else
        redirect_back(:fallback_location => "/", :notice => "Competition created successfully.")
      end
    else
      render("competitions/new.html.erb")
    end
  end

  def edit
    @competition = Competition.find(params[:id])

    render("competitions/edit.html.erb")
  end

  def update
    @competition = Competition.find(params[:id])

    @competition.name = params[:name]

    save_status = @competition.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/competitions/#{@competition.id}/edit", "/update_competition"
        redirect_to("/competitions/#{@competition.id}", :notice => "Competition updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Competition updated successfully.")
      end
    else
      render("competitions/edit.html.erb")
    end
  end

  def destroy
    @competition = Competition.find(params[:id])

    @competition.destroy

    if URI(request.referer).path == "/competitions/#{@competition.id}"
      redirect_to("/", :notice => "Competition deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Competition deleted.")
    end
  end
end
