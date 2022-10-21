class TweetsController < ApplicationController
    
    # Ejercicio 3
    # Muestro todos los tweets ordenados por fecha de creacion desc.
    def index
      @tweets = Tweet.all.order(created_at: :desc)
    end 
  
    # Busca el tweet según id
    def show
      @tweet = Tweet.find(params[:id])
    end

    # Ejercicio 6
    def create
      # Se crea un tweet 
      @tweet = Tweet.new(tweets_params)
      
      if @tweet.save 
          redirect_to @tweet, notice: "Tweet creado."
      else
          render :new
      end
    end

    private
    def tweets_params
      params.require(:tweet).permit(:content, :monster_id)
    end

end