
require 'sinatra'
require 'sinatra/reloader'

# ABC = Always Be Committing

####CONSTANTS
$wins_hash = {
  :rock => :scissors,
  :rock => :lizard,
  :scissors => :paper,
  :scissors => :lizard,
  :paper => :rock,
  :paper => :spock,
  :lizard => :paper,
  :lizard => :spock,
  :spock => :rock,
  :spock => :scissors
}


#### LOGIC


            # ######### Example from morning exercise - for example purposes only.

            # def computer_choses
            #   computer_choice = $possible_choices[rand(4)-1]
            #   return computer_choice
            # end


            # def evaluate_results(user_choice, computer_choice)
            #   user_choice = user_choice.to_sym
            #   if user_choice == computer_choice
            #     return "Tie!"
            #   elsif user_choice == $wining_states_hash[computer_choice]
            #     return "Computer wins!"
            #   elsif user_choice != $wining_states_hash[computer_choice]
            #     return "User wins!"
            #   end
            # end

            # get '/play/:user_choice' do
            #   @user_choice = params[:user_choice]
            #   @computer_choice = computer_choses()
            #   @result = evaluate_results(@user_choice, @computer_choice)
            #   erb :result
            # end



def evaluate_results(user_choice, computer_choice)
  user_choice = user_choice.to_sym
  if user_choice == computer_choice
    return "Tie!"
  elsif user_choice == $wining_states_hash[computer_choice]
    return "Computer wins!"
  elsif user_choice != $wining_states_hash[computer_choice]
    return "User wins!"
  end
end



### CONTROLLER
get '/' do
  redirect('/play')
end

get '/play' do
  erb :play
end


get '/play/:user_choice' do
    @user_choice = params[:user_choice]
    @computer_choice = $wins_hash.keys.sample
    @result = evaluate_results(@user_choice, @computer_choice)
    erb :result
end
