class QuizController < ApplicationController

  def new
    $quiz = $quiz? $quiz : Quiz.create
    puts $quiz.inspect

  end
  def edit
    if $quiz.update_attributes(quiz_params)
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def quiz_params
    params.require(:quiz).permit(:name)
  end
end
