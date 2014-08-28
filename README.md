# Mastermind

This is a take on the board game [Mastermind](http://en.wikipedia.org/wiki/Mastermind_(board_game)).

It's an excercise recommended by [The Odin Project](http://www.theodinproject.com/)

I learned a ton by writing this command line game. It is probably one of the more complex applications I've built, with the exception of Blogger which was built using step by step instructions. For this game, I experimented to find the right combination classes and methods to make this a functional game.

And it *is* functional. According to my most recent test anyway. 

Were I to continue to develop this application I would continue to make improvements.

The display_board method in particular needs work. It could be more informative and have a better lay out. It could do a better job of showing the relationship between code pegs and key pegs.

The AI for guessing codes and providing keys could be much better. Providing memory around what were bad guesses would be a good start for that. 

There is also numerous instances where refactoring the code could make it more readable.

However, for the purpose of this exercise, I am satisfied with the state of the application and I'm moving on.


## Installation

_I haven't tested any sort of installation process, assuming you'd even ever want to do this_

Add this line to your application's Gemfile:

    gem 'mastermind'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mastermind

## Usage

Currently, you would created an instance of the GameFlowControl class and invoke the begin_game method.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
