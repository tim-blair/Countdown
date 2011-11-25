def solve(target, numbers)
	best_diff = target
	best_str = ''
	n = numbers.size
	ops = []
	n.times do
		ops << '+'
		ops << '-'
		ops << '*'
		ops << '/'
	end
	uniqOps = []
	n.downto(2) do |i|
		uniqOps[i] = ops.permutation(i - 1).to_a.uniq
	end
	n.downto(2) do |i|
		numbers.permutation(i).to_a.uniq do |nums|
			uniqOps[i].each do |op|
				str = ''
				numbers.each do |num|
					str << num.to_s
					str << op.pop unless op.empty?
				end
				result = eval str
				if (target - result).abs < best_diff
					best_diff = (target - result).abs
					best_str = str
					if best_diff == 0
						puts "Found: #{str}"
						return str
					end
				end
			end
		end
	end
	puts "Closest was: #{best_diff} via: #{best_str}"
	best_str
end

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

solve(target, nums)
