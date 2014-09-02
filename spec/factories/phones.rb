# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :phone do
		association :contact 
		phone_number "123456"

		factory :home_phone do
			phone_type "home"
		end
		factory :office_phone do
			phone_type "office"
		end
		factory :personal_phone do
			phone_type "personal"
		end
		
	end
end
