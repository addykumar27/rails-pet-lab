class Appointment < ApplicationRecord:Base
	belongs_to :pet, optional: true

end
