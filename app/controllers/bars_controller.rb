class BarsController < ApplicationController

  def index
    if params[:search].present?
      @bars = Bar.where("name ILIKE ? OR address ILIKE ? ", "%#{params[:search][:query]}%", "%#{params[:search][:query]}%")
    else
      @bars = Bar.all
    end
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save!
      redirect_to bar_path(@bar), flash: {notice: "Successfully!"}
      flash.now[:notice] = 'Successfully booking!'
    else
      render :new, status: :unprocessable_entity
    end


  end

  def update
  end

  def delete
  end

  def edit
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :address, :description, :price, :user_id)
  end
end
