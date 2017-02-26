class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(strong_params)

    if @category.save
      flash[:Successfully] = "Kategori Başarıyla Oluşturuldu."
      redirect_to category_path(@category)
    else
      flash[:error] = "Kategori oluşturulamadı."
      render :new
    end
  end

  private

  def strong_params
    params.require(:category).permit(:name)
  end
end
