class VariantController < ApplicationController

  def new
    @variant = Variant.new(variant_params)
    $variants << @variant
    respond_to do |format|
      format.js
    end
  end

  def create
  end

  def delete
    if params[:var_id]
      $question = Question.find(params[:q_id].to_i)
      variant = $question.variants.find(params[:var_id].to_i)
      debug('deleted var by id', variant)
      variant.destroy
      variant.save
      puts('question.vars', $question.variants.inspect)
    elsif params[:var_ix]
      $variants.delete_at(params[:var_ix].to_i)
    end
  end

  private
  def variant_params
    params.require(:variant).permit(:text)
  end
end
