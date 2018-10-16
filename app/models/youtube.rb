class Youtube < ApplicationRecord

	require 'rss'
<<<<<<< HEAD
=======


>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
	
	def open_rss
		playlist_id = "PL6lGa-KrTKc1um2NJMFnXn_oFmzOe-oii"
		playlist_url = "https://www.youtube.com/feeds/videos.xml?playlist_id=" + playlist_id
		
		feed = Feedjira::Feed.fetch_and_parse playlist_url
		video = feed.entries.first
		
		details = {:title => video.title,
					:description => video.content,
					:url => video.media_url,
					:thumbnail => video.media_thumbnail_url
					}
		
		return details
	end

	def featured
		details = open_rss
		return details
	end

end
