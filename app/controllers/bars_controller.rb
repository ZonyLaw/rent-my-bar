class BarsController < ApplicationController
  def home
  end

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
  @bar.save!
  # redirect_to bar_path(@bar)
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
