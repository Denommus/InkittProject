namespace :quizz do
  desc "TODO"
  task generate: :environment do
    (1..5).each do |i|
      q = Question.find_or_create_by(description: "question #{i}")
      (1..[5, i+1].min).each do |j|
        Answer.find_or_create_by(description: "answer #{i}-#{j}", question_id: q.id)
      end
    end
  end

end
