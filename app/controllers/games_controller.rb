require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.shuffle[0..10]
    #afficher une nouvelle grille aléatoire et un formulaire
  end

  def score
  @user_input = params[:word]
  @letters = params[:letters]
  url = "https://wagon-dictionary.herokuapp.com/#{@user_input}"
  letters = URI.open(url).read
  json = JSON.parse(letters)
  wordexists = json['found']

verif = @user_input.chars.all? {|letter| @user_input.count(letter) <= @letters.count(letter)}


  if wordexists == true && verif == true
@answer = "Congratulations! #{@user_input} is a valid English word"

elsif verif == false
  @answer = "Sorry but #{@user_input} can't be built out of #{@letters}"

else
  @answer = "Sorry but #{@user_input} is not a valid English word..."
end
    # 3Le mot ne peut pas être créé à partir de la grille d’origine.
    # 2Le mot est valide d’après la grille, mais ce n’est pas un mot anglais valide.
    # 1Le mot est valide d’après la grille et est un mot anglais valide.

    #formulaire sera envoyé (avec POST) à l’action score
  end
end

    #letters.map { |letter| JSON.parse(letter) }
    # letter = JSON.parse(letters)
    #
