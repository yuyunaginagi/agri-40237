class CreateTeachingMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :teaching_materials do |t|
      t.references :user        , null: false, foreign_key: true
      t.references :subject     , null: false, foreign_key: true
      t.string     :title       , null: false
      t.binary     :file        , null: false
      t.timestamps
    end
  end
end
