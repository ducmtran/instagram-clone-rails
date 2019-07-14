class WelcomeController < ApplicationController
  def index
    puts response.status
  end

  def about
    @name = :duc
  end
end
