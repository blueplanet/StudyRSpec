# encoding:utf-8
require 'spec_helper'

describe Entry do
  fixtures :entries, :blogs

  before(:each) do
    @entry = entries(:kakutani_earliest)
  end

  it "は特定のブログに属すること" do
    @entry.blog.should == blogs(:kakutani)
  end
end

describe Entry, "#posted_on が入力されずに保存された場合:" do
  fixtures :blogs

  before do
    @entry = Entry.new(:blog => blogs(:kakutani),
                       :title => "タイトル", :body => "本文")
    @entry.save!
    @entry.reload
  end

  it "Entry の作成日は投稿日であること" do
    @entry.posted_on.should == Date.today
  end
end

describe Entry, "#posted_on を明示して保存された場合:" do
  fixtures :blogs

  before do
    @posted_on = Date.today - 10
    @entry = Entry.new(:blog => blogs(:kakutani),
                       :title => "タイトル", :body => "本文",
                      :posted_on => @posted_on)
    @entry.save!
    @entry.reload
  end

  it "入力された日付が投稿日であること" do
    @entry.posted_on.should == @posted_on
  end
end
