class TeachingMaterialsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_subject

  def new
    @subject = Subject.find(params[:subject_id])
    @teaching_material = TeachingMaterial.new

    unless @subject.user_id == current_user.id
      redirect_to root_path
    end
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

  def destroy
    @teaching_material = TeachingMaterial.find(params[:id])
    @teaching_material.destroy
    redirect_to subject_path(@teaching_material.subject)
  end

  def edit
    @subject = Subject.find(params[:subject_id])
    @teaching_material = TeachingMaterial.find(params[:id])

    unless @teaching_material.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @teaching_material = TeachingMaterial.find(params[:id])
    if @teaching_material.update(teaching_material_params)
      redirect_to subject_path(@teaching_material.subject)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def teaching_material_params
    params.require(:teaching_material).permit(:title, files: []).merge(user_id: current_user.id, subject_id: params[:subject_id])
  end

  def authenticate_user!
    # ユーザーがログインしていない場合はリダイレクト
    redirect_to new_user_session_path unless current_user
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

end
