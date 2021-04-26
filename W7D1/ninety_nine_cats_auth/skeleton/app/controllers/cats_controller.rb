class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end
  #gwendolyn, swimming
  def show
    @cat = Cat.find(params[:id])
    @user = User.find_by(id: @cat.user_id)
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    if current_user == @cat.owner
      render :edit
    else
      redirect_to cat_url(@cat)
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
