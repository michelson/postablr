xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Postablr"
    xml.description "Change me ..."
    xml.link blog_url

    for post in @entries
      xml.item do
        #xml.title post.title
        #xml.description post.content
        xml.pubDate post.created_at.to_s(:rfc822)
        #xml.link blog_url(post)
        #xml.guid blog_url(post)
      end
    end
  end
end