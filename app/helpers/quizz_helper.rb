module QuizzHelper
  def percentage(question, answer)
    total = question.answers.sum(:count)
    if total==0
      return "Not enough answers"
    end
    ((100.0*answer.count)/total).round(2)
  end
end
