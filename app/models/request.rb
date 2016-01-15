class Request < ApplicationRecord
	require_dependency File.join(Rails.root, "lib", "dni_validator.rb")
	validates :amount, :days, presence: true
	validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 600}
	validates :days, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 30}
	validates_with DniValidator, :if => "dni.present?"
	validates :email, format: { :with => /\A([a-z0-9\-_\.]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :if => "email.present?"
	validates :cellphone, format: { with: /\d{3}-\d{3}-\d{4}/, :message => "Cellphone must be in xxx-xxx-xxxx format." }, :if => "cellphone.present?"
end
