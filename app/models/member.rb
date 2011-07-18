class Member < ActiveRecord::Base
	attr_accessible :name, :birthdate, :email, :pic

	belongs_to :user
   has_attached_file :pic, 
                     :styles => {:medium => "300x300#", :thumb => "100x100#"},
                     :storage => :s3,
                     :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                     :path => "/:attachment/:id/:style.:extension"


	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true,
	                 :length   => { :maximum => 50 }
	validates :email,:allow_blank => true,
				     :format   => { :with => email_regex },
	                 :uniqueness => { :case_sensitive => false }
end