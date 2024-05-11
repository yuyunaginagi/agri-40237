class SubjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = current_user.id

    if @subject.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @subject = Subject.find(params[:id])
    @user = User.find(@subject.user_id)
    @teaching_materials = @subject.teaching_materials
    @exams = @subject.exams
  end

  private

  def subject_params
    params.require(:subject).permit(:subject_name, :image).merge(user_ids: current_user.id)
  end

  def authenticate_user!
    # ユーザーがログインしていない場合はリダイレクト
    redirect_to new_user_session_path unless current_user
  end

end
