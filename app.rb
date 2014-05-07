
require 'sinatra'
require 'sinatra/reloader'

# ABC = Always Be Committing


# If you're making edits of the code, copy and paste the code into
# your section and make edits there. The merge conflicts only happen
# if we're editing the same code. We can then communicate and review
# which code we should use.




############ CHRIS'S CODE ###############


#combined John's simplified .include? code.

$wins_hash = {
  :rock => [:scissors, :lizard],
  :scissors => [:paper, :lizard],
  :paper => [:rock, :spock],
  :lizard => [:paper, :spock],
  :spock => [:rock, :scissors]
}

#~~~~~~~~~~~~

def evaluate_results(user_choice, computer_choice)
  user_choice = user_choice.to_sym
  if user_choice == computer_choice
    return "Tie!"
  elsif $wins_hash[user_choice].include?(computer_choice)
    return "User wins!"
  else #
    return "Computer wins!"
  end
end


#~~~~~~~~~


get '/' do
  redirect('/play')
end

get '/play' do
  erb :play
end


get '/play/:user_choice' do
    @user_choice = params[:user_choice].to_sym
    @computer_choice = $wins_hash.keys.sample
    @result = evaluate_results(@user_choice, @computer_choice)
    erb :result
end


########### END CHRIS ###################



########### ANDREW'S CODE #################






########### END ANDREW ###################







############# JOHN'S CODE ##################

###CONSTANTS
$wining_states_hash = {
  :rock => [:scissors, :lizard],
  :scissors => [:paper, :lizard],
  :paper => [:rock, :spock],
  :lizard => [:paper, :spock],
  :spock => [:rock, :scissors]
}


#### LOGIC
def evaluate_results(user_choice, computer_choice)
  user_choice = user_choice.to_sym
  if user_choice == computer_choice
    return "Tie!"
  elsif $wining_states_hash[user_choice].include?(computer_choice)
    return "User wins!"
  else #
    return "Computer wins!"
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




############# END JOHN #####################

