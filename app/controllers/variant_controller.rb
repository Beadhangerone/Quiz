class VariantController < ApplicationController

  def new
    @variant = params[:variant][:text]
    $variants << @variant # Validate the input
    respond_to do |format|
      format.js
    end
  end

  def create
    @variant = $question.variants.create(variant_params)
    if @variant
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def variant_params
    params.require(:variant).permit(:text)
  end
end
