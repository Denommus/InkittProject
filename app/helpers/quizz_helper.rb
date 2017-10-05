module QuizzHelper
  def percentage(question, answer)
    total = question.total_count
    if total==0
      return "Not enough answers"
    end
    ((100.0*answer.count)/total).round(2)
  end
end
