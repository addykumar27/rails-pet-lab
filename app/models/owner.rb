class Owner < ActiveRecord::Base
   	has_many :pets
    has_many :appointments, through: :pets

	before_save :normalize_phone_number

	validates :first_name,
            presence:   true,
            length:   { maximum: 255 }

 	validates :last_name,
            presence:   true,
            length:   { maximum: 255 }

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
       if phone.present?
      phone.gsub!(/^1/, "")
      phone.gsub!(/[()-.]/,"")
    	end
  end

end
