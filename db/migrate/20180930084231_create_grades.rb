class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.integer :year

      t.timestamps
    end
  end
end
