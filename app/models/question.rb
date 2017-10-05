class Question < ApplicationRecord
  has_many :answers

  def self.show_questions
    self
      .joins('LEFT JOIN answers ON answers.question_id = questions.id')
      .select('questions.*, SUM(answers.count) AS total_count')
      .group(:id)
      .includes(:answers)
  end
end
