require 'byebug'

METHODS = %w[path method_id defined_class binding self return_value raised_exception enable disable
enabled?
event
lineno].map(&:to_sym)

EVENTS = [:line, :class, :end, :call, :return, :c_call, :c_return, :raise, :thread_begin, :thread_end]

trace = TracePoint.trace(:line) do |tp|
  METHODS.each do |m|
    begin
      puts "(#{m}): #{tp.send(m)}"
    rescue 
    end
  end
end

trace.enable

sum = 0

threads = (1..2).map do
  Thread.new do
    5.times do
      sum += 1
    end
  end
end

threads.each(&:join)
puts sum
