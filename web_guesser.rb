require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
number = SECRET_NUMBER

get '/' do
	guess = params["guess"]
	message,background = check_guess(guess)
	erb :index, :locals => {:number => number, :message => message, :background => background}
end

def check_guess(g)
	case 
	when g.to_i > SECRET_NUMBER
		 (SECRET_NUMBER+1..SECRET_NUMBER+5).include?(g.to_i) ? ["Too high!",  b = "indianred"] : ["Way too high!", b = "firebrick"]
	when g.to_i < SECRET_NUMBER
		 (SECRET_NUMBER-5..SECRET_NUMBER-1).include?(g.to_i) ? ["Too low!", b = "indianred"]  : ["Way too low!", b = "firebrick"] 
	when g.to_i == SECRET_NUMBER
		"You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
	end
end





