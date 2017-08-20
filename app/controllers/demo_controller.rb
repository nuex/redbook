class DemoController < ApplicationController

  layout 'application'
  
  def index
    render('hello')
  end
  
  def hello
  end
  
end
