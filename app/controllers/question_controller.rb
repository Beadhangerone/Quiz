class QuestionController < ApplicationController

  def new
    $variants = $variants ? $variants : []
  end

  def create
    question = Question.create(question_params)
    $quiz.questions << question

    $variants.each do |var|
      variant = Variant.create(text: var)
      question.variants << variant
    end

    $variants = nil
    redirect_to new_quiz_path
  end

  def edit
    $question = $quiz.questions.find(params[:id])
    $variants = []
  end

  def update
    $question = $quiz.questions.find(params[:id])
    if $question.update(question_params)
      debug('variants', $variants)
      $variants.each do |var|
        variant = Variant.new(text: var)
        $question.variants << variant
      end
      debug('question.variants', $question.variants)
      $question = nil
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
