class CoachingsController < ApplicationController
  before_action :current_user_must_be_coaching_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_coaching_user
    coaching = Coaching.find(params[:id])

    unless current_user == coaching.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @coachings = Coaching.all

    render("coachings/index.html.erb")
  end

  def show
    @coaching = Coaching.find(params[:id])

    render("coachings/show.html.erb")
  end

  def new
    @coaching = Coaching.new

    render("coachings/new.html.erb")
  end

  def create
    @coaching = Coaching.new

    @coaching.team_id = params[:team_id]
    @coaching.user_id = params[:user_id]

    save_status = @coaching.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/coachings/new", "/create_coaching"
        redirect_to("/coachings")
      else
        redirect_back(:fallback_location => "/", :notice => "Coaching created successfully.")
      end
    else
      render("coachings/new.html.erb")
    end
  end

  def edit
    @coaching = Coaching.find(params[:id])

    render("coachings/edit.html.erb")
  end

  def update
    @coaching = Coaching.find(params[:id])

    @coaching.team_id = params[:team_id]
    @coaching.user_id = params[:user_id]

    save_status = @coaching.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/coachings/#{@coaching.id}/edit", "/update_coaching"
        redirect_to("/coachings/#{@coaching.id}", :notice => "Coaching updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Coaching updated successfully.")
      end
    else
      render("coachings/edit.html.erb")
    end
  end

  def destroy
    @coaching = Coaching.find(params[:id])

    @coaching.destroy

    if URI(request.referer).path == "/coachings/#{@coaching.id}"
      redirect_to("/", :notice => "Coaching deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Coaching deleted.")
    end
  end
end
