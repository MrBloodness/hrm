class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees, :force => true do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :employee_state, index: true
      t.string :internal_phone
      t.string :mobile_phone
      t.string :external_phone
      t.string :private_phone
      t.text :actual_address
      t.text :legal_address
      t.date :employed_since
      t.decimal :salary, :precision => 6, :scale => 2
      t.string :bank_name
      t.string :bank_account
      t.timestamps
    end
  end
end
