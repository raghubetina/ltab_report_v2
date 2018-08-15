class BoutsController < ApplicationController
  def index
    @q = Bout.ransack(params[:q])
    @bouts = @q.result(:distinct => true).includes(:rounds, :availabilities, :checkins, :competition).page(params[:page]).per(10)

    render("bouts/index.html.erb")
  end

  def show
    @checkin = Checkin.new
    @availability = Availability.new
    @round = Round.new
    @bout = Bout.find(params[:id])

    render("bouts/show.html.erb")
  end

  def new
    @bout = Bout.new

    render("bouts/new.html.erb")
  end

  def create
    @bout = Bout.new

    @bout.competition_id = params[:competition_id]
    @bout.begins_at = params[:begins_at]
    @bout.location = params[:location]
    @bout.title = params[:title]
    @bout.length = params[:length]

    save_status = @bout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bouts/new", "/create_bout"
        redirect_to("/bouts")
      else
        redirect_back(:fallback_location => "/", :notice => "Bout created successfully.")
      end
    else
      render("bouts/new.html.erb")
    end
  end

  def edit
    @bout = Bout.find(params[:id])

    render("bouts/edit.html.erb")
  end

  def update
    @bout = Bout.find(params[:id])

    @bout.competition_id = params[:competition_id]
    @bout.begins_at = params[:begins_at]
    @bout.location = params[:location]
    @bout.title = params[:title]
    @bout.length = params[:length]

    save_status = @bout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bouts/#{@bout.id}/edit", "/update_bout"
        redirect_to("/bouts/#{@bout.id}", :notice => "Bout updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bout updated successfully.")
      end
    else
      render("bouts/edit.html.erb")
    end
  end

  def destroy
    @bout = Bout.find(params[:id])

    @bout.destroy

    if URI(request.referer).path == "/bouts/#{@bout.id}"
      redirect_to("/", :notice => "Bout deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bout deleted.")
    end
  end
end
