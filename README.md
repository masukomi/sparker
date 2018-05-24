[![Build Status](https://travis-ci.org/masukomi/sparker.svg?branch=master)](https://travis-ci.org/masukomi/sparker)

# Sparker
### Better Sparklines for Crystal

There are 2 parts to this.

* A library for adding sparkline capabilities to your command line apps
* A small executable that generates sparklines from your input

## The Executable

### Building
```
crystal build src/sparkline.cr
```

This will build a `sparkline` executable in the current directory. Just put it
somewhere in your PATH and you're done.

### Using
You can either pipe in a bunch of comma separate integers

```
echo "23, 64, 100" | sparkline # => ▁▅█
```

or you can pass them in as the first argument

```
sparkline "23, 64, 100" # => ▁▅█
```

If you pass them in as the first option you can also apply data fitting by
passing "fit" as the second argument.

```
sparkline "23, 88, 100" fit # =>  ▄█
```

## The Library

The Sparker clas takes an array of integers and converts it into a graph
suitable for use in command line tools. It allows for custom characters for your
graph. You could even get really funky and have HTML + CSS for each "character"
and generate html graphs from command line data. 

(NOTE: The HTML version of these examples have a weirdly uneven baseline 
in many browsers. Not to worry. They'll look great on your command line.)

For example:  
This: `[0, 30, 55, 80, 33, 150]` becomes `" ▁▂▄▁█"`

Because tiny variations can get lost, especially with large numbers you can do 
data fitting to the smallest number. This is, of course, optional.

Maybe you'd like to use different characters for your graph? No worries. Sparker
has you covered. You can even use multiple characters as a single bar tick. The
more ticks you provide, the more precise the graph becomes.

## Installation
Add this to your application's `shard.yml`:

```yaml
dependencies:
  sparker:
    github: masukomi/sparker
```

## Usage

```crystal
require 'sparker'
include Sparkline

sparker = Sparker.new() 
sparker.generate([1, 5, 22, 13, 53])             #=> "  ▃▁█"
sparker.generate([0, 30, 55, 80, 33, 150])       # => " ▁▂▄▁█"
```

Want to use your own characters for the graph? Just initialize it with 
an array of them.

```crystal
sparker = Sparker.new(["aa", "bb", "cc", "dd", "ee", "ff", "gg", "hh", "ii"]) 
sparker.generate([0, 30, 55, 80, 33, 150]) # => "aabbcceebbii"
```

Ok, that example wasn't the most useful, but you're a clever person. I'm sure
you can think up something cool to do with that.

If you don't like the nothingness of the zero tick mark there's an alternate 
set of ticks built in with a tiny dot (`U+0702`) instead. 

```crystal
sparker = Sparker.new(Sparker::TICKS_2) # => "܂▁▂▃▄▅▆▇█"
sparker.generate [0, 30, 55, 80, 33, 150] # => "܂▁▂▄▁█"
```

As I mentioned above, you can turn on data fitting.When it's time to generate
your graph, just pass in a second parameter of `true` to enable that feature.

```crystal
# with data fitting
sparker.generate([88,100], true)    # =>" █"
# without data fitting
sparker.generate([88,100], false)   # => "▇█"
# with data fitting
sparker.generate([80,90,100], true) # =>" ▄█"
# without data fitting
sparker.generate([80,90,100], false) # => "▆▇█"
```

## Contributing

1. Fork it ( https://github.com/masukomi/sparker/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
    * Please include [unit tests]((https://crystal-lang.org/api/Spec.html)) 
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
6. Poke [@masukomi](https://twitter.com/masukomi) on Twitter to make sure 
   it gets seen promptly.

## Contributors

## Credits

[Original Idea](https://github.com/holman/spark) by 
[Zack Holman](https://twitter.com/holman). [Ported to Python](https://github.com/kennethreitz/spark.py) by [Kenneth Reitz](https://www.kennethreitz.org/). 
[Ported to Crystal (via Python)](https://github.com/ilmanzo) by [Andrea
Manzini](http://ilmanzo.github.io/) and improved by
[masukomi](https://masukomi.org).


