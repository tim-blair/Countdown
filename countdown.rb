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

nums = generate(smalls, 6 - smalls)
target = Random.new.rand(100..1000)

puts "The numbers are: #{nums}"
puts "The target is: #{target}"
