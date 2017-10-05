class QuizzController < ApplicationController
  helper QuizzHelper
  def index
    # The requirements fit perfectly into sessions
    session['answers'] ||= []

    # Were all the questions answered?
    if session['answers'].length >= Question.count
      @questions = Question.show_questions
      return render "finish.html.erb"
    end
    @current_question = Question.find(session['answers'].length+1)
  end

  def create
    session['answers'] << params[:answer][:answer]
    Answer.increment_answers!(session['answers'])
    redirect_to controller: :quizz, action: :index
  end
end
