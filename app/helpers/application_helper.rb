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

	def logo
    	image_tag("logo.png", :alt => "Family Home Evening logo", :class => "round")
  	end



end
