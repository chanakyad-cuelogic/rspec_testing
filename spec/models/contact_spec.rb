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

	it "returns a contact full name as a string" do
		contact = Contact.new(firstname: "john",lastname: "dippy",email: "jdippy@hover.com")
		expect(contact.fullname).to eq 'john dippy'
	end

		it "sorts the lastname as per given input" do
			smith = Contact.create(firstname: 'John', lastname: 'Smith',
			email: 'jsmith@example.com')
			jones = Contact.create(firstname: 'Tim', lastname: 'Jones',
			email: 'tjones@example.com')
			johnson = Contact.create(firstname: 'John', lastname: 'Johnson',
			email: 'jjohnson@example.com')
			# expect(Contact.by_letter("J")).to eq [johnson, jones]
			expect(Contact.by_letter("J")).to_not include smith
		end

	describe "filter last name by letter" do 
		before :each do
			@smith = Contact.create(firstname: 'John', lastname: 'Smith',
			email: 'jsmith@example.com')
			@jones = Contact.create(firstname: 'Tim', lastname: 'Jones',
			email: 'tjones@example.com')
			@johnson = Contact.create(firstname: 'John', lastname: 'Johnson',
			email: 'jjohnson@example.com')
		end
		context "matching letters " do
			it "returns the matching lastname with the given letters" do
				expect(Contact.by_letter("J")).to eq [@johnson, @jones]				
			end
		end

		context "matching letters" do
			it "returns the matching lastname with the given letters" do
				expect(Contact.by_letter("J")).to_not include @smith
			end
		end


		it "has valid factory" do
			expect(create(:contact)).to be_valid
		end
	end



		# it "returns a sorted array of results that match" do
		# 	smith = Contact.create(firstname: 'John', lastname: 'Smith',
		# 	email: 'jsmith@example.com')
		# 	jones = Contact.create(firstname: 'Tim', lastname: 'Jones',
		# 	email: 'tjones@example.com')
		# 	johnson = Contact.create(firstname: 'John', lastname: 'Johnson',
		# 	email: 'jjohnson@example.com')
		# 	expect(Contact.by_letter("J")).to eq [johnson, jones]
		# end

end