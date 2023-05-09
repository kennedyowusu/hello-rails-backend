class Api::V1::GreetingController < ApplicationController
  before_action :set_cors_headers

  def index
    @greetings = Greeting.all
    if @greetings.empty?
      render json: { message: 'Sorry, nothing to show' }
    else
      @greet = @greetings.sample
      render json: @greet
    end
  end

  private

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*' # Replace with the domain or origin of your app
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE' # Specify the allowed HTTP methods
    headers['Access-Control-Allow-Headers'] = 'Content-Type' # Specify the allowed request headers
  end
end
