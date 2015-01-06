class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:about, :index]
  def index
  end

  def about
  end

end
