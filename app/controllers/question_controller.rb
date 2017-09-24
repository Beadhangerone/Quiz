class QuestionController < ApplicationController

  def new
    $question = Question.new
    $variants = []
    #make action specific scripts
  end

  def create
    $question.update(question_params)
    if $quiz.questions << $question
      $variants.each do |var|
        $question.variants << var
      end
        $question = nil
        $variants = nil
        redirect_to new_quiz_path
    end
  end

  def edit
    $question = $quiz.questions.find(params[:id])
    $variants = []
  end

  def update
    $question.update(question_params)
    if $question.save()
      $variants.each do |var|
        $question.variants << var
      end
      $question = nil
      $variants = nil
      redirect_to new_quiz_path
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
