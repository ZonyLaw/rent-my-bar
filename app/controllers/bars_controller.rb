class BarsController < ApplicationController
  def home
  end

  def show
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
  @bar.save
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
    params.require(:bar).permit(:name, :address, :description, :price, :user)
  end
end
