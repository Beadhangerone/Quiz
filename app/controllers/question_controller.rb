class QuestionController < ApplicationController


  def new
    $question = $quiz.questions.new
    $question.save
  end

  def edit
    if $question.update_attributes(question_params)
      respond_to do |format|
        format.js
      end
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def check
    answer = Question.find(params[:id]).variants.where(is_answer: true).take()
    rightA = answer.id.to_i
    clientA = params[:answ_id].to_i
    nextQPath = get_question_path( params[:id].to_i+1 ).to_s

    render json:({
        'rightA': rightA,
        'clientA': clientA,
        'nextQPath': nextQPath,
    })

  end

  private
  def question_params
    params.require(:question).permit(:question)
  end


end
