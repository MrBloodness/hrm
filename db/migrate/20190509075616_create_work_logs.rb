class CreateWorkLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :work_logs do |t|
      t.references :employee, index: true
      t.decimal :spent_time, :precision => 10, :scale => 2
      t.string :type
      t.date :log_date
      t.text :comment
      t.timestamps
    end
  end
end
