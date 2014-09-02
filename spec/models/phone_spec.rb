require 'spec_helper'

describe 'Phone' do
	it "does not allow duplicate phone_numbers per contact" do
		contact = Contact.create(firstname: 'Gihel', lastname: 'Cool', email: 'hidsh@ggig.com')
		home_phone = contact.phones.create(phone_type: 'home', phone_number: '124578')
		mobile_phone = contact.phones.build(phone_type: 'mobile', phone_number: '124578')
		expect(mobile_phone).to have(1).errors_on(:phone_number)
	end
end

 