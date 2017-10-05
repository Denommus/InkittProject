class Answer < ApplicationRecord
  belongs_to :question

  def self.increment_answers!(answers)
    # The answers are only stored if the user answered all the
    # questions. If there are more answers than questions something
    # probably went wrong and we ignore it (the user experience won't
    # be affected)
    if answers.length == Question.count
      self.where(id: answers).update_all('count = count + 1')
    end
  end
end
