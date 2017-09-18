class VariantController < ApplicationController

  def new
    @variant = Variant.new(variant_params)
    $variants << @variant
    respond_to do |format|
      format.js
    end
  end

  def create
    # $question.variants << @variant # Validate the input
  end

  def delete     # BUG!!! new after delete!!!! 
    if params[:var_id]
      $question.variants.find(params[:var_id]).delete
    elsif params[:var_ix]
      $variants.delete_at(params[:var_ix].to_i)
    end
  end

  private
  def variant_params
    params.require(:variant).permit(:text)
  end
end
