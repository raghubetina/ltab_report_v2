class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.page(params[:page]).per(10)

    render("checkins/index.html.erb")
  end

  def show
    @checkin = Checkin.find(params[:id])

    render("checkins/show.html.erb")
  end

  def new
    @checkin = Checkin.new

    render("checkins/new.html.erb")
  end

  def create
    @checkin = Checkin.new

    @checkin.poet_id = params[:poet_id]
    @checkin.bout_id = params[:bout_id]

    save_status = @checkin.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/checkins/new", "/create_checkin"
        redirect_to("/checkins")
      else
        redirect_back(:fallback_location => "/", :notice => "Checkin created successfully.")
      end
    else
      render("checkins/new.html.erb")
    end
  end

  def edit
    @checkin = Checkin.find(params[:id])

    render("checkins/edit.html.erb")
  end

  def update
    @checkin = Checkin.find(params[:id])

    @checkin.poet_id = params[:poet_id]
    @checkin.bout_id = params[:bout_id]

    save_status = @checkin.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/checkins/#{@checkin.id}/edit", "/update_checkin"
        redirect_to("/checkins/#{@checkin.id}", :notice => "Checkin updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Checkin updated successfully.")
      end
    else
      render("checkins/edit.html.erb")
    end
  end

  def destroy
    @checkin = Checkin.find(params[:id])

    @checkin.destroy

    if URI(request.referer).path == "/checkins/#{@checkin.id}"
      redirect_to("/", :notice => "Checkin deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Checkin deleted.")
    end
  end
end
