module ApplicationHelper

	def meetings_grouped_by_weekday(meetings)
		# Receives array of meetings and outputs array of strings in format of "WKDY TIME, TIME and TIME"
		
		formatted_meetings = []
		
		meetings.each do |meeting|
			day = Regexp.new Date::ABBR_DAYNAMES[meeting.weekday]
			
			if formatted_meetings.any? { |val| day =~ val } == false
				# If weekday is not already listed in formatted_meetings, add a string in the format of "WKDY TIME" to the array
				formatted_meetings << "#{Date::ABBR_DAYNAMES[meeting.weekday]} #{meeting.time.strftime("%-l:%M %p")}"
			else
				s = formatted_meetings.find_index{ |d| d.include? Date::ABBR_DAYNAMES[meeting.weekday]}
				if formatted_meetings[s].include? "and"
					# If weekday is listed and already has an "and" (signifying multiple times in string), swap out all "and"s for commas and append "and TIME"
					statement = formatted_meetings[s]
					statement.gsub!(" and", ",")
					statement += " and #{meeting.time.strftime("%-l:%M %p")}"
					formatted_meetings[s] = statement
				else
					# If weekday is listed but with only one time, append "and TIME"
					formatted_meetings[s] = "#{formatted_meetings[s]} and #{meeting.time.strftime("%-l:%M %p")}"
				end
			end
		end
		return formatted_meetings
	end
	
<<<<<<< HEAD
	def phone_format(phone)
		number = "(" + phone[0..2] + ") " + phone[3..5] + "-" + phone[6..9]
		return number
	end
	
	def mainmenuItems
		items = []
		submenus = Submenu.where(:mainmenu => true)
		menuitems = Menuitem.where(:mainmenu => true)
		
		submenus.each do |s|
			items << s
		end
		
		menuitems.each do |m|
			items << m
		end
		
		return items
	end
	
	def markdown(text)
		options = {
			filter_html:	true,
			hard_wrap:		true,
			link_attributes: { rel: 'nofollow', target: "_blank" },
			space_after_headers: true,
			fenced_code_blocks: true
		}
		
		extensions = {
			autolink:		true,
			superscript:	true,
			disable_indented_code_blocks: true
		}
		
		renderer = Redcarpet::Render::HTML.new(options)
		markdown = Redcarpet::Markdown.new(renderer, extensions)
		
		markdown.render(text).html_safe
	end
=======
	
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
	
end
