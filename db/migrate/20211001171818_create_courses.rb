class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.datetime :started_at
      t.integer :total_month
      t.integer :total_member
      t.integer :status, :limit => 4, default: 0

      t.timestamps
    end
  end
end
