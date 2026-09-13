class SliderController < ApplicationController
  before_action :authenticate

  def index
    @setting = Setting.current
  end

  def new
    @setting = Setting.current
  end

  def create
    @setting = Setting.current

    if @setting.update(slider_params)
      redirect_to slider_index_path, notice: "Imágenes actualizadas correctamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @setting = Setting.current

    image_name = params[:image].to_s
    allowed_images = %w[banner_1 banner_2 banner_3]

    if allowed_images.include?(image_name)
      @setting.public_send(image_name).purge
    end

    redirect_to slider_index_path, notice: "Imagen eliminada correctamente"
  end

  private

  def slider_params
    params.require(:setting).permit(:banner_1, :banner_2, :banner_3)
  end

  def authenticate
    authenticate_or_request_with_http_basic do |_username, password|
      password == ENV["ADMIN_PASSWORD"]
    end
  end
end
