class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def new
    @colors = Cat::COLORS
    render :new
  end

  # <% Cat.COLORS %> 

  private
  def cat_params
    params.require(:cat).permit(:birth_date, :sex, :color, :name, :description)
  end
end
