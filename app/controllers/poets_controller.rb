class PoetsController < ApplicationController
  def index
    @q = Poet.ransack(params[:q])
    @poets = @q.result(:distinct => true).includes(:team, :enrollments, :poems, :checkins, :participations).page(params[:page]).per(10)

    render("poets/index.html.erb")
  end

  def show
    @checkin = Checkin.new
    @poem = Poem.new
    @enrollment = Enrollment.new
    @poet = Poet.find(params[:id])

    render("poets/show.html.erb")
  end

  def new
    @poet = Poet.new

    render("poets/new.html.erb")
  end

  def create
    @poet = Poet.new

    @poet.team_id = params[:team_id]
    @poet.first_name = params[:first_name]
    @poet.last_name = params[:last_name]
    @poet.phone_number = params[:phone_number]
    @poet.email = params[:email]

    save_status = @poet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/poets/new", "/create_poet"
        redirect_to("/poets")
      else
        redirect_back(:fallback_location => "/", :notice => "Poet created successfully.")
      end
    else
      render("poets/new.html.erb")
    end
  end

  def edit
    @poet = Poet.find(params[:id])

    render("poets/edit.html.erb")
  end

  def update
    @poet = Poet.find(params[:id])

    @poet.team_id = params[:team_id]
    @poet.first_name = params[:first_name]
    @poet.last_name = params[:last_name]
    @poet.phone_number = params[:phone_number]
    @poet.email = params[:email]

    save_status = @poet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/poets/#{@poet.id}/edit", "/update_poet"
        redirect_to("/poets/#{@poet.id}", :notice => "Poet updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Poet updated successfully.")
      end
    else
      render("poets/edit.html.erb")
    end
  end

  def destroy
    @poet = Poet.find(params[:id])

    @poet.destroy

    if URI(request.referer).path == "/poets/#{@poet.id}"
      redirect_to("/", :notice => "Poet deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Poet deleted.")
    end
  end
end
