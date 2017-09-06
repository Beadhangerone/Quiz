class VariantController < ApplicationController

  def new
    @variant = params[:variant][:text]
    $variants << @variant # Validate the input
    debug('variants', $variants)
    respond_to do |format|
      format.js
    end
  end

  def create
  end

  private
  def variant_params
    params.require(:variant).permit(:text)
  end
end
