module ApplicationHelper
	#return a custom title per page
	def title
		base = "Family Home Evening"
		if @title.nil?
			base
		else
			"#{base} | #{@title}"
		end
	end
end
