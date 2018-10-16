module PrayersHelper
	
	def scripture_lookup(reference)
		
		options = "&include-passage-references=false&include-first-verse-numbers=false&include-verse-numbers=false&include-footnotes=false&include-footnote-body=false&include-short-copyright=false&include-copyright=false&include-passage-horizontal-lines=false&include-heading-horizontal-lines=false&include-headings=false&include-selahs=false&indent-using=tab&indent-paragraphs=0&indent-poetry=false&indent-poetry-lines=0&indent-declares=0&indent-psalm-doxology=0&line-length=0"
		info = 'https://api.esv.org/v3/passage/text/?q=' + reference.encode("iso-8859-1").force_encoding("utf-8") + options
		
		uri = URI.parse(info)
		request = Net::HTTP::Get.new(uri)
		request["Authorization"] = Rails.application.secrets.esv_api_key

		req_options = {
			use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
			http.request(request)
		end
		
		result = JSON.parse(response.body)
		
		return result["passages"][0]
	end
	
	def scriptures_list(prayer)
		scriptures = []
		prayer.scripture_1.present? ? scriptures << prayer.scripture_1 : nil
		prayer.scripture_2.present? ? scriptures << prayer.scripture_2 : nil
		prayer.scripture_3.present? ? scriptures << prayer.scripture_3 : nil
		
		return scriptures
	end
end
