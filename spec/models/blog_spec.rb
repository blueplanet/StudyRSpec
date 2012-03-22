# encoding=utf-8
require 'spec_helper'

describe Blog, " #name が設定されていない場合:"  do
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
