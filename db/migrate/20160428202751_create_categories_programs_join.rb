class CreateCategoriesProgramsJoin < ActiveRecord::Migration
  def change
    create_table :categories_programs, :id => false do |t|
	  t.integer "category_id"
	  t.integer "program_id"	
    end
	add_index :categories_programs, ["category_id", "program_id"]
	
  end
end
