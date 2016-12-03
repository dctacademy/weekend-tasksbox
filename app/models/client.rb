class Client < ActiveRecord::Base

	has_many :projects # returns an array
	
 	belongs_to :user

	validates_presence_of :name, :company
	validates_uniqueness_of :company
	validates_numericality_of :mobile, allow_blank: true # :allow_blank => true
	validates_length_of :mobile, is: 10, allow_blank: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

end

=begin
	1) Methods of gems
	2) has_many associations
	3) belongs_to 
	4) validations
	5) user defined class methods	
	6) user defined instance methods
	7) private methods
=end
