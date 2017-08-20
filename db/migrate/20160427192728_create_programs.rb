class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
	  t.column "name", :string, :null => false
	  t.string "shortdesc", :null => false, :limit => 300
	  t.text "description"
	  t.text "eligibility"
	  t.string "keywords"
	  t.string "phonenum", :limit => 10
	  t.string "email", :limit => 250
	  t.string "website", :limit => 100
	  t.string "pyaddress", :limit => 250
	  t.string "pycity", :limit => 60
	  t.string "pystate", :limit => 2
	  t.string "pyzip", :limit => 10
	  t.string "maddress", :limit => 250
	  t.string "maddress2", :limit => 250
	  t.string "mcity", :limit => 60
	  t.string "mstate", :limit => 2
	  t.string "mzip", :limit => 10
	  
	  t.timestamps null: false
    end
  end
end
