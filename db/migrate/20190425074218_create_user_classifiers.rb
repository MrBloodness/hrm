class CreateUserClassifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_classifiers do |t|
      t.string :type
      t.string :value
      t.boolean :is_active, default: true
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
