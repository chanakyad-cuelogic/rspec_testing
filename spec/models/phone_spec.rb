require 'spec_helper'

describe 'Phone' do
	
	# it "does not allow duplicate phone_numbers per contact" do
	# 	contact = Contact.create(firstname: 'Gihel', lastname: 'Cool', email: 'hidsh@ggig.com')
	# 	home_phone = contact.phones.create(phone_type: 'home', phone_number: '124578')
	# 	mobile_phone = contact.phones.build(phone_type: 'mobile', phone_number: '124578')
	# 	expect(mobile_phone).to have(1).errors_on(:phone_number)
	# end

	# it "allows two contacts to share their numbers" do
	# 	contact = Contact.create(firstname: 'Gihel', lastname: 'Cool', email: 'hidsh@ggig.com')
	# 	contact.phones.create(phone_type: 'personal', phone_number: '9090909090')
	# 	other_contact = Contact.new
	# 	other_phone = other_contact.phones.build(phone_type: 'personal', phone_number: '9090909090')
	# 	expect(other_phone).to be_valid
	# end

	it "allows two contacts to share a phone number" do
		create(:home_phone, phone_number: "9090909090")
		expect(build(:home_phone, phone_number: "9090909090")).to be_valid
	end


	its "doesnt allow duplicate phone numbers per contact" do
		contact = create(:contact)
		home_phone = create(:home_phone, contact: contact, phone_number: "12233")
		mobile_phone = build(:office_phone, contact: contact, phone_number: "12233")
		expect(mobile_phone).to have(1).errors_on(:phone_number) 
	end

	it "allows two contacts to share their numbers" do
		contact_one = create(:contact)
		home_phone = create(:home_phone, contact: contact_one, phone_number: "23435")
		contact_two = create(:contact)
		home_phone  = create(:home_phone, contact: contact_two, phone_number: "23435")
		expect(home_phone).to be_valid
	end
 
end
