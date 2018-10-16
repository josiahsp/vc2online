module EventsHelper

	def start_end_date_time_format(start, endtime)
		if start == endtime
			content = "<page-section-head>Time:</page-section-head> <page-section-content>#{start.strftime("%a, %b %e, %Y – %l:%M%p")}</page-section-content>"
		elsif start != endtime && start.day == endtime.day
			content = "<page-section-head>Date:</page-section-head> <page-section-content>#{start.strftime("%a, %b %e, %Y")}</page-section-content><br /><br /><page-section-head>Start Time:</page-section-head> <page-section-content>#{start.strftime("%l:%M%p")}</page-section-content><br /><br /><page-section-head>End Time:</page-section-head> <page-section-content>#{endtime.strftime("%l:%M%p")}</page-section-content>"
		elsif start != endtime && start.day != endtime.day
			content = "<page-section-head>Event Start:</page-section-head> <page-section-content>#{start.strftime("%B %e, %Y – %l:%M%p")}</page-section-content><br /><br /><page-section-head>Event End:</page-section-head> <page-section-content>#{endtime.strftime("%B %e, %Y – %l:%M%p")}</page-section-content>"
		end
		
		return content
	end

end
