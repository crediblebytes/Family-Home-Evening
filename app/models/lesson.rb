class Lesson < ActiveRecord::Base
	belongs_to :user


	#set constraints
	validates :content, :length => {:maximum => 160}
end
