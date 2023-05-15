class HomeController < ApplicationController
    devise_group :people, contains: [:user, :venue]
    before_action ->{ authenticate_people! :venue }
  def index
  end
end
