class QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.save
    redirect_to subject_path(@question.subject_id)
  end

  def destroy
    question = Question.find(params[:id])
    @subject = Subject.find(params[:subject_id])
    question.destroy
    redirect_to @subject
  end


  private

  def question_params
    params.require(:question).permit(:question).merge(user_id: current_user.id, subject_id: params[:subject_id])
  end
end
