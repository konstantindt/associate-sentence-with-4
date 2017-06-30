# app.rb
require 'sinatra'

# Model
class Sentence

  # Class variable(s).
  @@sentences_root = 'Once upon a time...'
  @@sentences = Hash.new

  # Instance field(s) getters.
  attr_reader :asscociated_sentences

  def initialize()
    # Instance variable(s).
    @asscociated_sentences = Array.new(4)
  end

  # Instance method(s).

  def select_sentence(index)
    @asscociated_sentences[index]
  end

  def set_sentence(new_sentence, index)
    @asscociated_sentences[index] = new_sentence
  end

  # Class method(s).

  def self.sentences_root
    return @@sentences_root
  end

  def self.sentences
    return @@sentences
  end

  def self.set_sentences_root(s_root)
    @@sentences_root = s_root
  end
end

get '/' do
  # Display Home page.
  @title = 'Associate Sentence with 4'
  erb :index
end

post '/sentence' do
  # Controller:
  @center_sentence = if params.has_key?(:sentences_root)
    Sentence.set_sentences_root(params[:sentences_root])
    Sentence.sentences.store(Sentence.sentences_root, Sentence.new)

    Sentence.sentences_root
  elsif params.has_key?(:new_sentence)
    Sentence.sentences[params[:center_sentence]].set_sentence(params[:new_sentence], params[:index].to_i)
    Sentence.sentences.store(params[:new_sentence], Sentence.new)

    params[:center_sentence]
  elsif params.has_key?(:view_sentence_associated)
    params[:view_sentence_associated]
  else
    raise RuntimeError.new('Matched no expected params.')
  end

  @associated = Sentence.sentences[@center_sentence]

  # View
  erb :sentences
end
