class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.string  :code
      t.string  :surname
      t.string  :first_name
      t.string  :last_name
      t.string  :designation
      t.date    :birth_date
      t.date    :join_date
      t.string  :contact_mobile
      t.attachment  :picture

      t.timestamps
    end
  end
end
