module Api
  class TestController < ApplicationController
    def index
      render json: { status: 200, message: "Hello World!"}
    end
  end
end
