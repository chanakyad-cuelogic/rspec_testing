require 'spec_helper'

describe "Contact" do 
	it	"is invalid without firstname lastname and email" do 
		contact = Contact.new(firstname: "john",lastname: "dippy",email: "jdippy@hover.com")
		expect(contact).to be_valid
	end
	
	# it "is invalid without firstname"
	# it "is invalid without lastname"
	# it "is invalid without an email address"
	# it "is invalid with a duplicate email address"
	# it "returns a contact's full name as a string"
end