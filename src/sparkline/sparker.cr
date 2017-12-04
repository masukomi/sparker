module Sparkline
  # took from https://github.com/kennethreitz/spark.py
  # and https://github.com/holman/spark

  class Sparker
    TICKS   = " ▁▂▃▄▅▆▇█".split("")
    TICKS_2 = "܂▁▂▃▄▅▆▇█".split("")
    getter :ticks
    setter :ticks

    # Optionally takes an array of strings for ticks.
    # Ticks must proceed from smallest to largest.
    # Ticks _can_ be multiple characters long although it
    # is generally a bad idea unless you're just doubling the
    # same character on all of them.
    def initialize(@ticks : Array(String) = TICKS)
    end

    # Returns a spark string from given iterable of ints.
    # Arguments:
    # ints: an array of integers
    # fit_min: Matches the range of the sparkline to the input integers
    #         rather than the default of zero. Useful for large numbers with
    #         relatively small differences between the positions
    #         defaults to false
    # Usage
    # sparker = Sparker.new()
    # sparker.generate([1, 5, 22, 13, 53]) #=> "  ▃▁█"
    # sparker.generate([0, 30, 55, 80, 33, 150], true) # => " ▁▂▄▁█"
    # sparker.generate([80,90,100], true) # =>" ▄█" (true enables data fitting)
    #
    # Note: there are only 9 steps in the default ticks,
    # so the percentage breakdown is as follows
    # 0-12 :" "
    # 13-24:"▁"
    # 25-37:"▂"
    # 38-49:"▃"
    # 50-62:"▄"
    # 63-74:"▅"
    # 75-87:"▆"
    # 87-99:"▇"
    # 100  :"█"
    def generate(ints : Array(Int32 | Int64), fit_min : Bool = false) : String
      min_range = fit_min ? ints.min : 0
      step_range = ints.max - min_range
      step = step_range.to_f / (@ticks.size - 1).to_f
      step = 1 if step < 1
      String.build do |str|
        ints.each do |i|
          index = ((i - min_range) / step).to_i
          str << @ticks[index]
        end
      end
    end
  end
end
