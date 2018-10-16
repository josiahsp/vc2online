module IntelligentFeature

	def featured
		# intelligent featuring - version 1.0
		
		possibles = []
		# Get events in next 3 weeks
		upcoming_events = @events.soon
		upcoming_events.each do |event|
<<<<<<< HEAD
=======
			logger.warn "ADDING #{event.title} TO POSSIBLES ARRAY"
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
			possibles << event
		end
		
		# Get manually featured pages and events
		manually_featured = Feature.active.activated.not_expired.prioritized
		added_manuals = []
		possibles_events = []
		possibles.each do |p|
			if p.class == Event
				possibles_events << p
			end
		end
			
		manually_featured.each do |feature|
			logger.warn manually_featured.count
			if feature.event_id.present? && feature.page_id.blank?
				# Only for manually featured events
				if possibles_events.each_with_index.map {|e, i| [e.id, i] }.map {|e| e[0]}.include? feature.event_id
<<<<<<< HEAD
				else
=======
					logger.warn "FOUND DUPLICATE OF #{feature.event.title}"
				else
					logger.warn "ADDING #{feature.event.title} TO ADDED_MANUALS ARRAY"
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
					added_manuals << feature
				end
			else
				# Only for manually featured pages
				added_manuals << feature
			end
		end
		
<<<<<<< HEAD
=======
		logger.warn "ADDING ADDED_MANUALS ARRAY TO POSSIBLES ARRAY"
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
		added_manuals.each do |m|
			possibles << m
		end
		
		# If more than 3, sort by end times
		if possibles.count > 3
<<<<<<< HEAD
			possibles.sort! {|a, b| a[:endtime] <=> b[:endtime]}
			possibles = possibles.take(3)
=======
			possibles.order!(:endtime).limit(3)
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
		
		# If less, get latest video
		elsif possibles.count < 3
			# possibles << YouTube::featured
		end

		# If not 3, get next x events by start times where x is 3 - possibles.count
		if possibles.count < 3
			remaining = 3 - possibles.count
			future_events = @events.later.order(:start).limit(remaining)
			future_events.each do |e|
				unless possibles.map {|p| p.class == Event && p.id == e.id}
					possibles << e
				end
			end
		end
		
		return possibles
	end

end
