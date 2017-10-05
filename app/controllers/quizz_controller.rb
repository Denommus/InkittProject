class QuizzController < ApplicationController
  helper QuizzHelper
  def index
    # The requirements fit perfectly into sessions
    session['answers'] ||= []

    # Were all the questions answered?
    if session['answers'].length >= Question.count
      @questions = Question.includes(:answers).all
      return render "finish.html.erb"
    end
    @current_question = Question.find(session['answers'].length+1)
  end

  def create
    session['answers'] << params[:answer][:answer]
    # The answers are only stored if the user answered all the
    # questions. If there are more answers than questions something
    # probably went wrong and we ignore it (the user experience won't
    # be affected)
    if session['answers'].length == Question.count
      session['answers'].each { |a| Answer.find(a).increment!(:count) }
    end
    redirect_to controller: :quizz, action: :index
  end
end
