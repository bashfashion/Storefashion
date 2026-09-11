class AdminController < ApplicationController
  before_action :authenticate
  def index
    @products = Product.all
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
    if params[:sale_type].present?
      @products = @products.where(sale_type: params[:sale_type])
    end
  end

  def new
   @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_path, status: :see_other, notice: "Producto creado exitosamente"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to "/admin"
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to "/admin"
  end

  def update_rate
    rate = params[:rate].to_f

    Setting.first.update(rate: rate)

    # Recalcular todos los productos
    Product.find_each do |product|
      product.update(price_bs: product.price_usd * rate)
    end

    redirect_to admin_path, notice: "Tasa actualizada y precios recalculados"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_usd, :price_bs, :sale_type, :category_id, :quantity, :image, slider_images: [])
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      password == ENV["ADMIN_PASSWORD"]
    end
  end
end
