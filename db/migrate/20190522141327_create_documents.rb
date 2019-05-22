class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :number
      t.attachment :file
      t.string :title
      t.date :document_date
      t.date :deadline_date
      t.text :description
      t.references :user, index: true
      t.references :employee, index: true
      t.references :document_category, index: true
      t.references :document_state, index: true
      t.timestamps
    end
  end
end
