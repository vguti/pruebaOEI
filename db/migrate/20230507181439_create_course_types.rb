class CreateCourseTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :course_types do |t|
      t.string :name
      t.references :school, null: false, foreign_key: true

    end
  end
end
