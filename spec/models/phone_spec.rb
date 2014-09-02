require 'spec_helper'

describe 'Phone' do
	
	it "does not allow duplicate phone_numbers per contact" do
		contact = Contact.create(firstname: 'Gihel', lastname: 'Cool', email: 'hidsh@ggig.com')
		home_phone = contact.phones.create(phone_type: 'home', phone_number: '124578')
		mobile_phone = contact.phones.build(phone_type: 'mobile', phone_number: '124578')
		expect(mobile_phone).to have(1).errors_on(:phone_number)
	end

	it "allows two contacts to share their numbers" do
		contact = Contact.create(firstname: 'Gihel', lastname: 'Cool', email: 'hidsh@ggig.com')
		contact.phones.create(phone_type: 'personal', phone_number: '9090909090')
		other_contact = Contact.new
		other_phone = other_contact.phones.build(phone_type: 'personal', phone_number: '9090909090')
		expect(other_phone).to be_valid
	end

end

 