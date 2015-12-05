require "metaog/version"
require 'open-uri'
require 'nokogiri'

module Metaog
  # Your code goes here...
  def self.new url
    Core.new url
  end

  class Core
    attr_accessor :title, :url, :type, :image, :site_name, :description

    def initialize url
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
      @doc = Nokogiri::HTML.parse(html, nil, charset)

      @doc.xpath('//head/meta').each do |node|
        property = node.attr('property')

        # title
        if property == "og:title"
          @title = node.attr('content')
        end

        # url
        if property == "og:url"
          @url = node.attr('content')
        end

        # type
        if property == "og:type"
          @type = node.attr('content')
        end

        # image
        if property == "og:image"
          @image = node.attr('content')
        end

        # site_name
        if property == "og:site_name"
          @site_name = node.attr('content')
        end

        # description
        if property == "og:description"
          @description = node.attr('content')
        end

      end
    end

  end
end
