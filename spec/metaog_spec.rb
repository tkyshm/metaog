require 'spec_helper'

describe Metaog do
  it 'has a version number' do
    expect(Metaog::VERSION).not_to be nil
  end

  it 'retrieve meta tag initialize' do
    meta = Metaog::new "http://noragami-anime.net/"
    expect(meta.properties[:title]).to eq("TVアニメ「ノラガミ ARAGOTO」公式サイト")
    expect(meta.properties[:type]).to eq("website")
    expect(meta.properties[:url]).to eq("http://noragami-anime.net")
    expect(meta.properties[:image]).to eq("http://noragami-anime.net/common/ogp.jpg")
    expect(meta.properties[:site_name]).to eq("TVアニメ「ノラガミ ARAGOTO」公式サイト")
    expect(meta.properties[:description]).to eq("TVアニメ「ノラガミ ARAGOTO」公式サイト「ノラガミ ARAGOTO」2015年秋より、第2期放送開始！")
  end

end
