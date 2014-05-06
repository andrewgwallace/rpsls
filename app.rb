
require 'sinatra'
require 'sinatra/reloader'

get '/play' do

# Convert each key selection to the value for both the user and computer
wins_hash = {
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



computer_choice = wins_hash.keys.sample
user_choice = params[:selection].to_sym

# WIN
if wins_hash[user_choice] == computer_choice
  @results = "<p>You chose: #{user_choice}</p>"

# TIE
elsif user_choice == computer_choice
  @results = "TIE"

# LOSE
else
  @results = "You lose."
end
