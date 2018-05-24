# Handle ^C gracefully
Signal::INT.trap do
  exit 0
end
# END Handle ^C
STDIN.read_timeout = 0.1

require "./sparkline/*"

def usage()
  STDERR.puts "Usage: sparkline <comma separated integers> [fit]"
  STDERR.puts "      if \"fit\" is specified data-fitting will"
  STDERR.puts "      be applied."
end

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
    begin
      numbers = ARGF.gets_to_end.gsub(/\r\n|\n/, "").split(/,\s*/).map{|x|
        x == "" ? 0 : x.to_i}

      # while (line = ARGF.gets) != nil
      #   numbers = line.as(String).split(/,\s*/).map{|x|x.to_i}
      puts sparker.generate(numbers)
      # end
    rescue IO::Timeout
      usage()
      exit(1)
    end
  end
end
