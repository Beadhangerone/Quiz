class QuizController < ApplicationController

  def new
    $quiz = Quiz.create if !$quiz
    redirect_to show_quiz_path($quiz.id)
  end
  def show
    $quiz = Quiz.find(params[:id])
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
