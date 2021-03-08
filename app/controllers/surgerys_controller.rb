class SurgerysController < ApplicationController

  def show
    @surgery = Surgery.find(params[:id])
  end

  def index
    @surgeries = Surgery.ordered_average_practiced
  end
end
