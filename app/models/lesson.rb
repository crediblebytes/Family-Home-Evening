class Lesson < ActiveRecord::Base
	attr_accessible :title, :content #define what is editable through web

	# An association creates methods like lesson.user, user.lessons, user.lessons.create(), etc.
	belongs_to :user 

	# Validation
	validates :title,   :presence => true, :length => { :maximum => 70 }
	validates :content, :presence => true, :length => { :maximum => 140 }
  	validates :user_id, :presence => true



	default_scope :order => 'lessons.created_at DESC' #order lessons newest first
end
