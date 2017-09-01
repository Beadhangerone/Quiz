class QuizController < ApplicationController
  def new
    $quiz = $quiz ? $quiz : Quiz.new()
  end
  def edit
    $quiz.assign_attributes(quiz_params)
    respond_to do |format|
      format.js
    end
  end

  private
  def quiz_params
    params.require(:quiz).permit(:name)
  end
end
