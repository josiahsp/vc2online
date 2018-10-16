title = "VC2 Prayer Points"
author = "Victory Central Church"
description = "The weekly prayer points of VC2 in Tennille, GA.\n\nScripture quotations are from the ESV® Bible (The Holy Bible, English Standard Version®), copyright © 2001 by Crossway, a publishing ministry of Good News Publishers. Used by permission. All rights reserved. May not copy or download more than 500 consecutive verses of the ESV Bible or more than one half of any book of the ESV Bible."

#encoding: UTF-8
xml = Builder::XmlMarkup.new
xml.instruct! :xml, :version => "1.0"

xml.rss :version => "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
	xml.channel do
		xml.tag!("atom:link",  "href"=>"http://www.vc2online.com/prayerpoints.rss", "rel"=>"self", "type"=>"application/rss+xml") 
		xml.title title
		xml.link 'http://www.vc2online.com'
		xml.description description
		xml.language 'en'
		xml.pubDate @prayers.last.created_at.to_s(:rfc822)
		xml.lastBuildDate Time.now.to_s(:rfc822)

		@prayers.each do  |prayer|
			xml.item do
				prayer_description = "<p><i>#{prayer.details}</i></p>"
			
				if prayer.scripture_1.present?
					prayer_description = prayer_description + "<p><b>#{prayer.scripture_1}</b> - <i>#{scripture_lookup(prayer.scripture_1)}</i></p>"
				end
				
				if prayer.scripture_2.present?
					prayer_description = prayer_description + "<p><b>#{prayer.scripture_2}</b> - <i>#{scripture_lookup(prayer.scripture_2)}</i></p>"
				end
				
				if prayer.scripture_3.present?
					prayer_description = prayer_description + "<p><b>#{prayer.scripture_3}</b> - <i>#{scripture_lookup(prayer.scripture_3)}</i></p>"
				end
				
				def xml._escape(text)
					(text && caller[1].inspect.include?(%{`method_missing'})) ? "<![CDATA[#{text}]]>" : text
				end
				
				
				xml.title prayer.title
				xml.description prayer_description
				xml.summary scriptures_list(prayer).to_sentence
			end
		end
	end
end