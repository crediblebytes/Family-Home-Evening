class Member < ActiveRecord::Base
	attr_accessible :name, :birthdate, :email, :pic

	belongs_to :user
   has_attached_file :pic,
                     :storage => :s3,
                     :bucket => 'fhe-app',
                     :path => "/members/pic/:id/:style/:filename",
                     :s3_credentials => {
                        :access_key_id => ENV['S3_KEY'] || 'AKIAIG7I3ZRV4WWYCWAA',
                        :secret_access_key => ENV['S3_SECRET'] || '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'
                     }



	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true,
	                 :length   => { :maximum => 50 }
	validates :email,:allow_blank => true,
				     :format   => { :with => email_regex },
	                 :uniqueness => { :case_sensitive => false }
end
