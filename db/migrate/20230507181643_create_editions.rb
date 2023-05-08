class CreateEditions < ActiveRecord::Migration[7.0]
  def change
    create_table :editions do |t|
      t.date :date, unique: true
      t.references :course, null: true

    end
  end
end
