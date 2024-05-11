class ExamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @subject = Subject.find(params[:subject_id])
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    @exam.user_id = current_user.id
    if @exam.save
      redirect_to subject_path(@exam.subject)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @subject = Subject.find(params[:subject_id])
    @exams = @subject.exams
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    redirect_to subject_path(@exam.subject)
  end

  def edit
    @subject = Subject.find(params[:subject_id])
    @exam = Exam.find(params[:id])

    unless @exam.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update(exam_params)
      redirect_to subject_path(@exam.subject)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:title, files: []).merge(user_id: current_user.id, subject_id: params[:subject_id])
  end

  def authenticate_user!
    # ユーザーがログインしていない場合はリダイレクト
    redirect_to new_user_session_path unless current_user
  end

end
