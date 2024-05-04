class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.references :user        , null: false, foreign_key: true
      t.string     :subject_name, null: false
      t.text       :image       , null: false
      t.timestamps
    end
  end
end
