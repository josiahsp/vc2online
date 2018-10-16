module MulticastsHelper

	def hours(duration)
		hours = duration / 3600
		return hours
	end
	
	def minutes(duration)
		minutes = (duration / 60) % 60
		return "#{minutes}"
	end
	
	def seconds(duration)
		seconds = duration % 60
	end
	
	def others_in_collection(multicast)
		multicasts = Multicast.where(:collection_id => multicast.collection_id).where.not(id: multicast)
		
		return multicasts
	end


end
