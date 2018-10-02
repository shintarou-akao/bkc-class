class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true
      t.references :teacher, foreign_key: true
      t.string :lesson_evaluation
      t.string :lesson_level
      t.string :text_necessity
      t.string :attendance
      t.text :additional_explanation

      t.timestamps
    end
  end
end
