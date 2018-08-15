class PoemsController < ApplicationController
  def index
    @q = Poem.ransack(params[:q])
    @poems = @q.result(:distinct => true).includes(:poet, :round, :deductions, :scores, :penalties).page(params[:page]).per(10)

    render("poems/index.html.erb")
  end

  def show
    @score = Score.new
    @deduction = Deduction.new
    @poem = Poem.find(params[:id])

    render("poems/show.html.erb")
  end

  def new
    @poem = Poem.new

    render("poems/new.html.erb")
  end

  def create
    @poem = Poem.new

    @poem.round_id = params[:round_id]
    @poem.poet_id = params[:poet_id]
    @poem.minutes = params[:minutes]
    @poem.seconds = params[:seconds]
    @poem.notes = params[:notes]

    save_status = @poem.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/poems/new", "/create_poem"
        redirect_to("/poems")
      else
        redirect_back(:fallback_location => "/", :notice => "Poem created successfully.")
      end
    else
      render("poems/new.html.erb")
    end
  end

  def edit
    @poem = Poem.find(params[:id])

    render("poems/edit.html.erb")
  end

  def update
    @poem = Poem.find(params[:id])

    @poem.round_id = params[:round_id]
    @poem.poet_id = params[:poet_id]
    @poem.minutes = params[:minutes]
    @poem.seconds = params[:seconds]
    @poem.notes = params[:notes]

    save_status = @poem.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/poems/#{@poem.id}/edit", "/update_poem"
        redirect_to("/poems/#{@poem.id}", :notice => "Poem updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Poem updated successfully.")
      end
    else
      render("poems/edit.html.erb")
    end
  end

  def destroy
    @poem = Poem.find(params[:id])

    @poem.destroy

    if URI(request.referer).path == "/poems/#{@poem.id}"
      redirect_to("/", :notice => "Poem deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Poem deleted.")
    end
  end
end
