require 'rexml/document'

# Update xml conf file from sim.xml

include REXML
file = File.new("sim.xml")
doc = Document.new(file)
maxCol = Integer(XPath.first( doc, "/gnm:Workbook/gnm:Sheets/gnm:Sheet/gnm:MaxCol" ).text())
maxRow = Integer(XPath.first( doc, "/gnm:Workbook/gnm:Sheets/gnm:Sheet/gnm:MaxRow" ).text())
puts maxCol, maxRow
index = Array.new(maxCol+1)
data = Array.new(maxRow+1) { Hash.new() }
XPath.each( doc, "/gnm:Workbook/gnm:Sheets/gnm:Sheet/gnm:Cells/gnm:Cell" ) { |i|
	col = Integer(i.attribute("Col").to_s())
	row = Integer(i.attribute("Row").to_s())
	if row == 3 then
		index[col] = i.text()
	end
}
XPath.each( doc, "/gnm:Workbook/gnm:Sheets/gnm:Sheet/gnm:Cells/gnm:Cell" ) { |i|
	if i != nil and i.text() != nil and i.text() != "" then
		col = Integer(i.attribute("Col").to_s())
		row = Integer(i.attribute("Row").to_s())
		if row > 3 then
			data[row][index[col]] = i.text()
		end
	end
}



data.each { |i|
	if i['path'] != nil then
		baseName = i['path']+"/"+i['building']+"/"+i['building']
		xml = baseName+".xml"

		puts baseName+"\n"

		file = File.new(xml)
		doc = Document.new(file)

		xmlconf = Document.new()
		root = xmlconf.add_element("object", {"xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
"xsi:schemaLocation"=>"urn:oc:object http://www.opencity.info/xml/object.xsd",
"xmlns"=>"urn:oc:object"})

		property = root.add_element("property", {"type"=>i['type'], "radius"=>i['radius'], "inhabitant"=>i['pop'], "worker"=>i['work']})
			property.add_element("cost", {"build"=>i['const'], "destroy"=>i['dest'], "income"=>i['income'], "support"=>i['support']})
				r = property.add_element("r")
					r.add_element("need", {"min"=>i['rNeedMin'], "max"=>i['rNeedMax']})
					r.add_element("provide", {"min"=>i['rProvideMin'], "max"=>i['rProvideMax']})
				c = property.add_element("c")
					c.add_element("need", {"min"=>i['cNeedMin'], "max"=>i['cNeedMax']})
					c.add_element("provide", {"min"=>i['cProvideMin'], "max"=>i['cProvideMax']})
				ii = property.add_element("i")
					ii.add_element("need", {"min"=>i['iNeedMin'], "max"=>i['iNeedMax']})
					ii.add_element("provide", {"min"=>i['iProvideMin'], "max"=>i['iProvideMax']})
				t = property.add_element("t")
					t.add_element("need", {"min"=>i['tNeedMin'], "max"=>i['tNeedMax']})
					t.add_element("provide", {"min"=>i['tProvideMin'], "max"=>i['tProvideMax']})
				w = property.add_element("w")
					w.add_element("need", {"min"=>i['wNeedMin'], "max"=>i['wNeedMax']})
					w.add_element("provide", {"min"=>i['wProvideMin'], "max"=>i['wProvideMax']})
				e = property.add_element("e")
					e.add_element("need", {"min"=>i['eNeedMin'], "max"=>i['eNeedMax']})
					e.add_element("provide", {"min"=>i['eProvideMin'], "max"=>i['eProvideMax']})
				g = property.add_element("g")
					g.add_element("need", {"min"=>i['gNeedMin'], "max"=>i['gNeedMax']})
					g.add_element("provide", {"min"=>i['gProvideMin'], "max"=>i['gProvideMax']})
				nat = property.add_element("nature")
					nat.add_element("need", {"min"=>i['natNeedMin'], "max"=>i['natNeedMax']})
					nat.add_element("provide", {"min"=>i['natProvideMin'], "max"=>i['natProvideMax']})
				property.add_element("direction", {"value"=>i['dir']})
		root << XPath.first( doc, "/object/model")
		out = File.new(xml,"w")
		out << '<?xml version="1.0" encoding="utf-8"?>'+"\n"
		xmlconf.write( out )
		out << "\n"
	end
}
