class SubjectsController < ApplicationController
  # 各アクションの実行前に実行される
  # ログインしていないユーザーをTopページに遷移させる
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
    @questions = @subject.questions.includes(:user)
    @question = @subject.questions.build(user: current_user)
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to root_path
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
