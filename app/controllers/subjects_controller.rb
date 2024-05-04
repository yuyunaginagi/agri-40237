class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    # @subject.user = current_user
    if @subject.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    
  end

  private

  def subject_params
    params.require(:subject).permit(:subject_name, :image).merge(user_id: current_user.id)
  end

end
