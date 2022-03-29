class GreetingsController < ApplicationController

    before_action :set_greeting, only: %i[show update destroy]

    def index
        @random_greetings = Greeting.all.sample
        render json: @random_greetings
    end

    def show
    end

    def create
        @greeting = Greeting.new(greeting_params)
        if @greeting.save
            render json: @greeting
        else
            render json: @greeting.errors, status: :unprocessable_entity
        end
    end

    def update
    end

    def destroy
    end

    private
        def set_greeting
            @greeting = Greeting.find(params[:id])
        end

        def greeting_params
            params.require(:greeting).permit(:id, :body)
        end
end
