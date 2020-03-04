class AppoinmentBooking < ApplicationRecord
  belongs_to :user
  belongs_to :service_center
  Two_wheeler = %w[bike activa Other]
  Four_wheeler = %w[truck car Other]
end
