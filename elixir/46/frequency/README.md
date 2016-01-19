# Frequency

Knowing how often a word appears in a sentence or block of text is helpful for creating word clouds and other types of word analysis. And it’s more useful when running it against lots of text.

Create a program that reads in a file and counts the frequency of words in the file. Then construct a histogram displaying the words and the frequency, and display the histogram to the screen.

Example Output Given the text file words.txt with this content:
badger badger badger badger mushroom mushroom snake badger badger badger

The program would produce the following output:
```
badger:   *******
mushroom: **
snake:    *
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add frequency to your list of dependencies in `mix.exs`:

        def deps do
          [{:frequency, "~> 0.0.1"}]
        end

  2. Ensure frequency is started before your application:

        def application do
          [applications: [:frequency]]
        end

## Tests

```
mix test
```
