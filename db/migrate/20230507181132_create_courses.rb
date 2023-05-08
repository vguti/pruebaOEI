class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :course_type, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.references :edition, null: false, foreign_key: true

    end
  end
end
