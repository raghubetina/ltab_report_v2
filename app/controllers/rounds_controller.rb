class RoundsController < ApplicationController
  def index
    @q = Round.ransack(params[:q])
    @rounds = @q.result(:distinct => true).includes(:bout, :poems).page(params[:page]).per(10)

    render("rounds/index.html.erb")
  end

  def show
    @poem = Poem.new
    @round = Round.find(params[:id])

    render("rounds/show.html.erb")
  end

  def new
    @round = Round.new

    render("rounds/new.html.erb")
  end

  def create
    @round = Round.new

    @round.bout_id = params[:bout_id]
    @round.number = params[:number]

    save_status = @round.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rounds/new", "/create_round"
        redirect_to("/rounds")
      else
        redirect_back(:fallback_location => "/", :notice => "Round created successfully.")
      end
    else
      render("rounds/new.html.erb")
    end
  end

  def edit
    @round = Round.find(params[:id])

    render("rounds/edit.html.erb")
  end

  def update
    @round = Round.find(params[:id])

    @round.bout_id = params[:bout_id]
    @round.number = params[:number]

    save_status = @round.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rounds/#{@round.id}/edit", "/update_round"
        redirect_to("/rounds/#{@round.id}", :notice => "Round updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Round updated successfully.")
      end
    else
      render("rounds/edit.html.erb")
    end
  end

  def destroy
    @round = Round.find(params[:id])

    @round.destroy

    if URI(request.referer).path == "/rounds/#{@round.id}"
      redirect_to("/", :notice => "Round deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Round deleted.")
    end
  end
end
