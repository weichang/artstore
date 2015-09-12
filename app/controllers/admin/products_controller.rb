class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end

  end

  def edit

    @product = Product.find(params[:id])

  end

  def update

    @product = Product.find(params[:id])

    if @product.update(products_params)

      redirect_to admin_products_path

    else
      render :edit
    end


  end

  private
   def products_params
      params.require(:product).permit(:title,:description,:price,:quantity)
   end
end
