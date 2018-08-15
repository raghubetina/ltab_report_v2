class PenaltiesController < ApplicationController
  def index
    @penalties = Penalty.all

    render("penalties/index.html.erb")
  end

  def show
    @deduction = Deduction.new
    @penalty = Penalty.find(params[:id])

    render("penalties/show.html.erb")
  end

  def new
    @penalty = Penalty.new

    render("penalties/new.html.erb")
  end

  def create
    @penalty = Penalty.new

    @penalty.title = params[:title]
    @penalty.points = params[:points]

    save_status = @penalty.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/penalties/new", "/create_penalty"
        redirect_to("/penalties")
      else
        redirect_back(:fallback_location => "/", :notice => "Penalty created successfully.")
      end
    else
      render("penalties/new.html.erb")
    end
  end

  def edit
    @penalty = Penalty.find(params[:id])

    render("penalties/edit.html.erb")
  end

  def update
    @penalty = Penalty.find(params[:id])

    @penalty.title = params[:title]
    @penalty.points = params[:points]

    save_status = @penalty.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/penalties/#{@penalty.id}/edit", "/update_penalty"
        redirect_to("/penalties/#{@penalty.id}", :notice => "Penalty updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Penalty updated successfully.")
      end
    else
      render("penalties/edit.html.erb")
    end
  end

  def destroy
    @penalty = Penalty.find(params[:id])

    @penalty.destroy

    if URI(request.referer).path == "/penalties/#{@penalty.id}"
      redirect_to("/", :notice => "Penalty deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Penalty deleted.")
    end
  end
end
