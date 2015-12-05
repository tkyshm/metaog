require 'spec_helper'

describe Metaog do
  it 'has a version number' do
    expect(Metaog::VERSION).not_to be nil
  end

  it 'retrieve meta tag initialize' do
    meta = Metaog::new "http://noragami-anime.net/"
    expect(meta.title).to eq("TVアニメ「ノラガミ ARAGOTO」公式サイト")
    expect(meta.type).to eq("website")
    expect(meta.url).to eq("http://noragami-anime.net")
    expect(meta.image).to eq("http://noragami-anime.net/common/ogp.jpg")
    expect(meta.site_name).to eq("TVアニメ「ノラガミ ARAGOTO」公式サイト")
    expect(meta.description).to eq("TVアニメ「ノラガミ ARAGOTO」公式サイト「ノラガミ ARAGOTO」2015年秋より、第2期放送開始！")
  end

end
