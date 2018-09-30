class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password_digest
      t.references :grade, foreign_key: true
      t.references :department, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
