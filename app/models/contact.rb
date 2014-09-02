class Contact < ActiveRecord::Base
attr_accessible :firstname, :lastname, :email
validates_presence_of :firstname
validates_uniqueness_of :email
has_many :phones
	
	def fullname
		[firstname, lastname].join(' ') 
	end
	def self.by_letter(letter)
		where("lastname LIKE ?", "#{letter}%").order(:lastname)
	end
end