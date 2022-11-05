class PagesController < ApplicationController
  def home
    @bars = Bar.all
  end
end
