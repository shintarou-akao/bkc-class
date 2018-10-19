class AddDepartmentToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :subjects, :department, foreign_key: true
  end
end
