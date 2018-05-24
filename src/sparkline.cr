# Handle ^C gracefully
Signal::INT.trap do
  exit 0
end
# END Handle ^C

require "./sparkline/*"

if File.basename(PROGRAM_NAME) != "crystal-run-spec.tmp"
  sparker = Sparkline::Sparker.new()
  if ARGV.size > 0
    numbers = ARGV[0].split(/,\s*/).map{|x|x.to_i}
    if ARGV.size == 1
      puts sparker.generate(numbers)
    else
      puts sparker.generate(numbers, ARGV[1] == "fit")
    end
  else
    # assume input on STDIN 
    # Can't find any docs on how to NOT hang if there isn't any
    while (line = ARGF.gets) != nil
      numbers = line.as(String).split(/,\s*/).map{|x|x.to_i}
      puts sparker.generate(numbers)
    end
  # else 
  # WHEN I FIGURE OUT HOW  TO NOT HANG IF THERE'S NO STDIN
  #   STDERR.puts "Usage: sparkline <comma separated integers> [fit]"
  #   STDERR.puts "      if \"fit\" is specified data-fitting will"
  #   STDERR.puts "      be applied."
  #   exit(1)
  end
end
