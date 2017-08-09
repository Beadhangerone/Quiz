module QuestionHelper
  def answer(question)
    question.variants.where(is_answer:true).take
  end
end
