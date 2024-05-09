class TeachingMaterialsController < ApplicationController
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
end
