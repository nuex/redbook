class AlterPrograms < ActiveRecord::Migration
  def change
    add_column("programs", "agency_id", :integer, :after => "id")
    add_index("programs", "agency_id")
	
  end
end
