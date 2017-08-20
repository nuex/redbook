class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
	  t.string "name"
	  t.string "phonenum", :limit => 10 
	  t.string "purpose", :limit => 250
	  t.string "website", :limit => 100
	
      t.timestamps null: false
    end
  end
end
