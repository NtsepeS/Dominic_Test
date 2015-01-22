require 'nokogiri'

xml = File.open('CoreNodes.xml')
 
doc = Nokogiri::XML(xml.read())
#puts doc.xpath("//Item/Title")


doc.css('Item').each do |node|
  children = node.children


  cnode = {
    'Title' => node.css('Title').inner_text
  }

puts cnode

end
