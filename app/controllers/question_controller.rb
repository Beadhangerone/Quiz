class QuestionController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end
  def check
    answer = Question.find(params[:id]).variants.where(is_answer: true).take()
    rightA = answer.id.to_i
    clientA = params[:answ_id].to_i

    render json:({
        'rightA': rightA,
        'clientA': clientA,
    })

  end
end
