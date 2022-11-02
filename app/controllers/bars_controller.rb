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
  end

  def create
  end

  def update
  end

  def delete
  end

  def edit
  end
end
