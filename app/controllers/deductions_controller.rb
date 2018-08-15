class DeductionsController < ApplicationController
  def index
    @deductions = Deduction.page(params[:page]).per(10)

    render("deductions/index.html.erb")
  end

  def show
    @deduction = Deduction.find(params[:id])

    render("deductions/show.html.erb")
  end

  def new
    @deduction = Deduction.new

    render("deductions/new.html.erb")
  end

  def create
    @deduction = Deduction.new

    @deduction.poem_id = params[:poem_id]
    @deduction.penalty_id = params[:penalty_id]

    save_status = @deduction.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/deductions/new", "/create_deduction"
        redirect_to("/deductions")
      else
        redirect_back(:fallback_location => "/", :notice => "Deduction created successfully.")
      end
    else
      render("deductions/new.html.erb")
    end
  end

  def edit
    @deduction = Deduction.find(params[:id])

    render("deductions/edit.html.erb")
  end

  def update
    @deduction = Deduction.find(params[:id])

    @deduction.poem_id = params[:poem_id]
    @deduction.penalty_id = params[:penalty_id]

    save_status = @deduction.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/deductions/#{@deduction.id}/edit", "/update_deduction"
        redirect_to("/deductions/#{@deduction.id}", :notice => "Deduction updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Deduction updated successfully.")
      end
    else
      render("deductions/edit.html.erb")
    end
  end

  def destroy
    @deduction = Deduction.find(params[:id])

    @deduction.destroy

    if URI(request.referer).path == "/deductions/#{@deduction.id}"
      redirect_to("/", :notice => "Deduction deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Deduction deleted.")
    end
  end
end
