class GreetingsController < ApplicationController
  def index
    @random_greetings = Greeting.all.sample
    render json: @random_greetings
  end
end
