# Technical test

## Premise
The exercise itself is simple, it is possible to create a simple bitmap class and add commands to the skeleton you provided in less than an hour, adding a basic params parsing and validation using regex or other.
I think that the purpose of this test is to do something more, the result will be for sure over-engineered respect to the requirements but in this way I can show my approach to solve a problem like if was a real world problem.
I spent for this exercise about 6 hours discontinued.

## Getting started
To run the console

    $ ruby runner.rb

To run the tests

    $ rspec

To check rubocop issues (0 issues)

    $ rubocop

To see the benchmark used to choose the best way to store bitmap pixels

    $ ruby benchmark.rb

# Background
The idea was to create three different components, a bitmap object, a generic console object and a bitmap editor (a particular console to edit the bitmap).

## Bitmap
It's a very simple object, indipendent from the rest. Implements the creation and all the basic requested bitmap operations.

## Console
I tried to imagine something like a generic and reusable console, with the ability to create custom commands. So i created a basic console object that loads custom commands from a path. Overriding the console is possible to create a special console the handle something more, for example I did this to create the bitmap editor.

## Command
This is the basic object for every command, implements the basic functions and validation. To write a new command it's necessary to
inherit from Command. I implemented a basic DSL to define the keyboard command to execute, the help message and a really simple params validation. The command must implement a process method where the command itself is executed. Inside an array of params is available, if process returns a string the output is showed in console.
This is an example to create a command:

    module Commands
      class Example < Command
        command 'C'
        help 'This is an example command.'
        params m: :integer, n: :letter

        def process
          "You executed a command with params #{params[:m]} and #{params[:n]}"
        end
      end
    end
