class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
	  t.string "first_name", :limit => 50
	  t.string "last_name", :limit => 50
	  t.string "email", :default => "", :null => false
	  t.string "password_digest"
	  t.timestamps null: false
    end
  end
end
