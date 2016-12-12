require "json"  
require "nokogiri"

module Sei

  module Printer

    def self.jp(json_text)  
      puts JSON.pretty_generate json_text
    end

    def self.xp(xml_text)  
      xsl = <<~HEREDOC
        <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
          <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
          <xsl:strip-space elements="*"
          <xsl:template match="/">
            <xsl:copy-of select="."/>
          </xsl:template>
        </xsl:stylesheet>
      HEREDOC

      doc  = Nokogiri::XML(xml_text)
      xslt = Nokogiri::XSLT(xsl)
      out  = xslt.transform(doc)

      puts out.to_xml
    end 

  end

end