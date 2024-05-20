class QuestionsController < ApplicationController

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    question = Question.find(params[:id])
    @subject = Subject.find(params[:subject_id])
    question.destroy
    redirect_to @subject
  end


  private

  def question_params
    params.require(:question).permit(:text).merge(user_id: current_user.id, subject_id: params[:subject_id])
  end
end
