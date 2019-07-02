class WelcomeController < ApplicationController
  def index
    @name = :dan
  end

  def about
    @name = :duc
  end
end
