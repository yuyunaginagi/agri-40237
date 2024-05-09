class TeachingMaterialsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @subject = Subject.find(params[:subject_id])
    @teaching_material = TeachingMaterial.new
  end

  def create
    @teaching_material = TeachingMaterial.new(teaching_material_params)
    @teaching_material.user_id = current_user.id
    if @teaching_material.save
      redirect_to subject_path(@teaching_material.subject)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @subject = Subject.find(params[:subject_id])
    @teaching_materials = @subject.teaching_materials
  end

  private

  def teaching_material_params
    params.require(:teaching_material).permit(:title, :file).merge(user_id: current_user.id, subject_id: params[:subject_id])
  end

  def authenticate_user!
    # ユーザーがログインしていない場合はリダイレクト
    redirect_to new_user_session_path unless current_user
  end

end
