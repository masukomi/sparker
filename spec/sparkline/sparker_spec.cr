require "../spec_helper"
include Sparkline

describe Sparker do
  # TICKS = " ▁▂▃▄▅▆▇█"
  it "should divide data into 9 steps" do
    # 11.11(repeating) per step
    # which rounds a bit weirdly so...
    sparker = Sparker.new
    sparker.generate([0, 100], false).should(eq(" █"))
    sparker.generate([0, 13, 100], false).should(eq(" ▁█"))
    sparker.generate([0, 25, 100], false).should(eq(" ▂█"))
    sparker.generate([0, 38, 100], false).should(eq(" ▃█"))
    sparker.generate([0, 50, 100], false).should(eq(" ▄█"))
    sparker.generate([0, 63, 100], false).should(eq(" ▅█"))
    sparker.generate([0, 75, 100], false).should(eq(" ▆█"))
    sparker.generate([0, 88, 100], false).should(eq(" ▇█"))
    # anything less than 100 doesn't make the last step
    sparker.generate([0, 100, 100], false).should(eq(" ██"))
  end
  it "should not fit to the minimum number by default" do
    sparker = Sparker.new
    sparker.generate([88, 100]).should(eq("▇█"))
    sparker.generate([80, 90, 100]).should(eq("▆▇█"))
  end
  it "should fit to the minimum when instructed" do
    sparker = Sparker.new
    sparker.generate([88, 100], true).should(eq(" █"))
    sparker.generate([80, 90, 100], true).should(eq(" ▄█"))
  end
  it "should allow custom ticks" do
    sparker = Sparker.new("012345678".split(""))
    sparker.generate([0, 100], false).should(eq("08"))
    sparker.generate([0, 13, 100], false).should(eq("018"))
    sparker.generate([0, 25, 100], false).should(eq("028"))
    sparker.generate([0, 38, 100], false).should(eq("038"))
    sparker.generate([0, 50, 100], false).should(eq("048"))
    sparker.generate([0, 63, 100], false).should(eq("058"))
    sparker.generate([0, 75, 100], false).should(eq("068"))
    sparker.generate([0, 88, 100], false).should(eq("078"))
    sparker.generate([0, 100, 100], false).should(eq("088"))
  end

  it "should allow custom ticks with multiple characters" do
    sparker = Sparker.new(Array(String).new + ["aa", "bb"])
    sparker.generate([0, 100], false).should(eq("aabb"))
  end
end
