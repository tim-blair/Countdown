require 'set'
def solve(target, numbers)
	best_diff = target
	best_result = 0
	best_method = ''
	method = {} #map [result, numbers] to how we combined the numbers to get the result
	ops = %w(+ - * /)
	result = {}
	numbers.each do |n|
		result[ [n] ] = Set.new [n]
		method[[n,[n]]] = n.to_s
	end
	(2..numbers.size).each do |i|
		numbers.permutation(i).to_a.uniq.each do |perm|
			(1..(perm.size - 1)).each do |s|
				left = perm.slice(0...s)
				right = perm.slice(s..-1)
				total = Set.new
				result[left].each do |lr|
					ops.each do |op|
						result[right].each do |rr|
							#sigh
							next if op == '/' and lr % rr != 0
							res = lr.send(op, rr)
							next if res < 1
							total.add(res)
							method[[res, perm]] = "(#{method[[lr,left]]}) #{op} (#{method[[rr,right]]})"
							if (res - target).abs < best_diff
								best_diff = (res - target).abs
								best_result = res
								best_method = method[[res, perm]]
								if best_diff == 0
									puts "Best result is #{target} via #{best_method}"
									return
								end
							end
						end
					end
				end
				result[perm] = total
			end
		end
	end
	puts "Best result is #{best_result} via #{best_method}"
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
