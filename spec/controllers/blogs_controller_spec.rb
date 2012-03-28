#encoding:utf-8
require 'spec_helper'

describe BlogsController do
  describe "GET /show/:id" do
    fixtures :blogs

    before do
      @blog = blogs(:kakutani)
      get 'show', :id => @blog.id
    end

    it "リクエストは成功すること" do
      response.should be_success
    end

    it ":idで指定したブログをロードすること" do
      assigns[:blog].should == blogs(:kakutani)
    end

    it "blogs/showを描画することblogs" do
      response.should render_template("blogs")
    end
    it "blogs/showを描画することblogs/show" do
      response.should render_template("show")
    end
  end
end
