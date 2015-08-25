require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    @type = params[:play].to_sym
    @game = RPSGame.new(@type)
    erb :rps_game
  end

end
