# Sparker
### Better Sparklines for Crystal

Sparker takes an array of integers and converts it into a graph
suitable for use in command line tools.


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

sparker = Sparker.new() 
sparker.generate([1, 5, 22, 13, 53])             #=> "  ▃▁█"
sparker.generate([0, 30, 55, 80, 33, 150])       # => " ▁▂▄▁█"
```

Want to use your own characters for the graph? Just initialize it with 
an array of them.

```crystal
sparker = Sparkline::Sparker.new(["aa", "bb", "cc", "dd", "ee", "ff", "gg", "hh", "ii"]) 
sparker.generate([0, 30, 55, 80, 33, 150]) # => "aabbcceebbii"
```

Ok, that example wasn't the most useful, but you're a clever person. I'm sure
you can think up something cool to do with that.

As I mentioned above, you can turn on data fitting.When it's time to generate
your graph, just pass in a second parameter of `true` to enable that feature.

```crystal
# with data fitting
sparker.generate([88,100], true)    #=>" █"
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


