class QuizController < ApplicationController

  def new
    $quiz = Quiz.create if !$quiz
    redirect_to edit_quiz_path($quiz.id)
  end
  def show
    $quiz = Quiz.find(params[:id])
  end
  def edit
    $quiz = Quiz.find(params[:id])
  end

  private
  def quiz_params
    params.require(:quiz).permit(:name)
  end
end
