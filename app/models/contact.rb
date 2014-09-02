class Contact < ActiveRecord::Base
attr_accessible :firstname, :lastname, :email
validates_presence_of :firstname
validates_uniqueness_of :email
has_many :phones
	
end