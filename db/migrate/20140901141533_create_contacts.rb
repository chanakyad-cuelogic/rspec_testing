class CreateContacts < ActiveRecord::Migration
  def up
  	 create_table :contacts do |t|
		t.string :firstname
		t.string :lastname
		t.string :email
	end
  end

  def down
  end
end
