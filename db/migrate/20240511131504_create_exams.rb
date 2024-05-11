class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.references :user        , null: false, foreign_key: true
      t.references :subject     , null: false, foreign_key: true
      t.string     :title       , null: false
      t.timestamps
    end
  end
end
