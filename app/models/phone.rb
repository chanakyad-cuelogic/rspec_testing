class Phone < ActiveRecord::Base
  belongs_to :contact
  attr_accessible :phone_number, :phone_type
  validates :phone_number, uniqueness: {scope: :contact_id}
end
