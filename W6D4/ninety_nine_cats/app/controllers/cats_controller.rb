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

  def create
    cat = Cat.new(cat_params)
    if cat.save
      redirect_to cat_url(cat)
    else
      redirect_to cats_url
    end
  end

  def destroy
    cat = Cat.find_by(id: params[:id])
    if cat.destroy
      redirect_to cats_url
    else
      redirect_to cat_url(cat)
    end
  end

  # <% Cat.COLORS %> 

  private
  def cat_params
    params.require(:cat).permit(:birth_date, :sex, :color, :name, :description)
  end
end
