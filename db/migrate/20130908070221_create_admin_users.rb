class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
      t.integer :user_id
      t.boolean :status, default: true
      t.timestamps
    end
  end

  def down
    drop_table :admin_users
  end
end
