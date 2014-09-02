require 'spec_helper'

describe "Contact" do 
	it	"is invalid without firstname lastname and email" do 
		contact = Contact.new(firstname: "john",lastname: "dippy",email: "jdippy@hover.com")
		expect(contact).to be_valid
	end

	it "is invalid without firstname" do
		expect(Contact.new(firstname: nil)).to have(1).errors_on(:firstname)
	end
	
	it "is invalid with the duplicate email address" do
		Contact.create(
			firstname: 'Apple', lastname: 'Maroca', email: 'apple@test.com'
			)
		contact = Contact.new(
			firstname: 'Millers', lastname: 'Cyers', email: 'apple@test.com'
			)
		expect(contact).to have(1).errors_on(:email)
	end

	# it "is invalid without firstname"
	# it "is invalid without lastname"
	# it "is invalid without an email address"
	# it "is invalid with a duplicate email address"
	# it "returns a contact's full name as a string"
end