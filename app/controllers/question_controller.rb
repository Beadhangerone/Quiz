class QuestionController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end
  def check
    answer = Question.find(params[:id]).variants.where(is_answer: true).take()
    puts(answer.id)
    puts(params[:answ_id])
    if(answer.id.to_i == params[:answ_id].to_i)
      puts('Right!')
    else
      puts('Wrong!')
    end

  end
end
