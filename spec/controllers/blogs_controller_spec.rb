#encoding:utf-8
require 'spec_helper'

describe BlogsController, "GET /show/:id" do
  fixtures :blogs

  it "リクエストは成功すること" do
    get 'show', :id => blogs(:kakutani).id
    response.should be_success
  end

  it ":idで指定したブログをロードすること" do
    get 'show', :id => blogs(:kakutani).id
    assigns[:blog].should == blogs(:kakutani)
  end
end
