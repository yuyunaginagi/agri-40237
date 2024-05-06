class SubjectsController < ApplicationController
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
  end

  private

  def subject_params
    params.require(:subject).permit(:subject_name, :image).merge(user_ids: current_user.id)
  end

end
