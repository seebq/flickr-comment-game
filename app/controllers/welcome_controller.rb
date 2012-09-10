class WelcomeController < ApplicationController
  def index
    @entry = Entry.all.sample
  end
end
