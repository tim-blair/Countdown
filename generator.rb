require_relative 'countdown'
def generate(small, large)
	larges = [25, 50, 75, 100]
	smalls = []
	(1...10).each do |i|
		smalls << i
		smalls << i
	end

	results = []
	smalls.shuffle!
	small.times do
		results << smalls.slice!(0)
	end

	larges.shuffle!
	large.times do
		results << larges.slice!(0)
	end

	results
end

puts 'How many smalls?'
resp = gets
smalls = resp.to_i

n = generate(smalls, 6 - smalls)
t = Random.new.rand(100..1000)

puts "The numbers are: #{n}"
puts "The target is: #{t}"

method = h(t, n)
puts "Best result is #{eval method} via #{method}"
