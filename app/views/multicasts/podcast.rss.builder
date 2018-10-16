title = "VC2 Podcast"
author = "VC2"
description = "The messages from VC2 - Real people meeting real needs with the reality of Christ."
keywords = "victory, central, church, chad, melinda, waller, worship, jesus, christ, central, georgia, christian, christianity"
ext = 'm4a'

#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"

xml.rss :version => "2.0", "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.tag!("atom:link",  "href"=>"https://rubyplus.com/episodes.rss", "rel"=>"self", "type"=>"application/rss+xml") 
    xml.title title
    xml.link 'https://www.vc2online.com'
    xml.description description
    xml.language 'en'
    xml.pubDate @podcasts.first.created_at.to_s(:rfc822)
    xml.lastBuildDate @podcasts.first.created_at.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => "http://www.vc2online.com/images/podcasts/defaultPodcast.jpg"
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'webmaster@vc2online.com'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Religion &amp; Spirituality' do
      xml.itunes :category, :text => 'Religion &amp; Spirituality'
    end
    xml.itunes :category, :text => 'Christianity' do
      xml.itunes :category, :text => 'Christianity'
    end

    @podcasts.each do |episode|
      xml.item do
        xml.title episode.title
        xml.description episode.summary
        xml.pubDate episode.pubdate.to_s(:rfc822)
        xml.itunes :image => episode.collection.present? ? episode.collection.artwork : "http://www.vc2online.com/public/images/assets/defaultpodcast.jpg"
        xml.enclosure :url => episode.audio.url, :length => episode.audio.size, :type => MimeMagic.by_extension(File.extname("#{episode.audio.path}"))
        xml.link multicast_url(episode)
        xml.guid({:isPermaLink => "false"}, episode.guid)
        xml.itunes :author, episode.author
        xml.itunes :subtitle, episode.collection.present? ? episode.collection.title : ""
        xml.itunes :summary, episode.summary
        xml.itunes :explicit, 'no'
        xml.itunes :duration, episode.duration
      end
    end
  end
end