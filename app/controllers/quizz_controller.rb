class QuizzController < ApplicationController
  def index
    # The requirements fit perfectly into sessions
    session['answers'] ||= []

    # This can be replaced by a database model
    # so answers could  be provided by an administrator
    # The model could also have validators to prevent
    # the admin from creating a question with too many answers
    @questions = [
      ['question 1', 'answer 1-1', 'answer 1-2'],
      ['question 2', 'answer 2-1', 'answer 2-2', 'answer 2-3'],
      ['question 3', 'answer 3-1', 'answer 3-2', 'answer 3-3', 'answer 3-4'],
      ['question 4', 'answer 4-1', 'answer 4-2', 'answer 4-3', 'answer 4-4', 'answer 4-5'],
      ['question 5', 'answer 5-1', 'answer 5-2', 'answer 5-3', 'answer 5-4', 'answer 5-5']
    ]

    # Were all the questions answered?
    if session['answers'].length >= @questions.length
      # Small trick to get the question descriptions and the respective user answer to it
      @answers = @questions.map { |x| x[0] }.
                   zip(session['answers'])
      render "finish.html.erb"
    end
    @current_question = @questions[session['answers'].length]
  end

  def create
    session['answers'] << params[:answer][:answer]
    redirect_to controller: :quizz, action: :index
  end
end
