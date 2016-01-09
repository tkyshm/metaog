# coding: utf-8
require "metaog/version"
require 'open-uri'
require 'nokogiri'
require 'kconv'

module Metaog
  # Your code goes here...
  def self.new url
    Core.new url
  end

  class Core
    attr_accessor :properties

    def initialize url
      @properties = {} if @properties.nil?

      html = open(url, "r:binary", 'User-Agent' => "metaog-bot/1.0.0") do |f|
        f.read
      end
      doc = Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')

      doc.xpath('//head/meta').each do |node|
        property = node.attr('property')

        if property =~ /^og:(.*)$/
          @properties[:"#{$1}"] = node.attr('content')
        end

      end
    end

  end

end
