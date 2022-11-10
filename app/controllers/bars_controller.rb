class BarsController < ApplicationController

  def index
    if params[:search].present?
      @bars = Bar.where("name ILIKE ? OR address ILIKE ? ", "%#{params[:search][:query]}%", "%#{params[:search][:query]}%")
    else
      @bars = Bar.all
    end

    @markers = @bars.geocoded.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude
        # info_window: render_to_string(partial: "info_window", locals: {bar: bar})
      }
    end

  end

  def show
    @bar = Bar.find(params[:id])
    @markers = [{lat: @bar.latitude, lng: @bar.longitude}]
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.user = current_user
    @bar.save!
    redirect_to bar_path(@bar)
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)
    redirect_to bar_path(@bar)
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to root_path, status: :see_other
  end


  private

  def bar_params
    params.require(:bar).permit(:name, :address, :description, :price, :user_id, photos: [])
  end
end
