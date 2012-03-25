# encoding=utf-8
require 'spec_helper'

describe Blog, "#name が設定されていない場合:"  do
  before(:each) do
    @blog = Blog.new
  end

  it "バリデーションに失敗すること" do
    @blog.should_not be_valid
  end

  it ":name にエラーが設定されていること" do
    @blog.should have(1).errors_on(:name)
  end
end   

describe Blog do
  fixtures :blogs, :entries

  before do
    @blog = blogs(:kakutani)
  end

  it "は複数の記事を所有できること" do
    @blog.should have_at_least(2).entries
  end
end

describe Blog, "に記事を投稿できた場合：" do
  fixtures :blogs, :entries

  before do
    @blog = blogs(:kakutani)
  end

  it "記事の件数が１件増えること" do
    lambda {
      @blog.entries.create(
        :title => 'new_post', :body => 'hello',
        :posted_on => Date.today)
    }.should change(Entry, :count).by(1)
  end
end
