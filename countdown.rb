def h t,n
d=t
m={}
u=%w(+ - * /)
b={}
n.each{|i|return i if i==t
b[[i]]=[i]
m[[i,[i]]]=i}
(2..n.size).each{|i|n.permutation(i).to_a.uniq.each{|p|(1..p.size-1).each{|s|l=p.slice(0...s)
a=p.slice(s..-1)
o=[]
b[l].each{|q|u.each{|k|b[a].each{|g|next if k=='/'&&q%g<1
c=q.send(k,g)
next if c==0
o=o|[c]
m[[c,p]]="(#{m[[q,l]]})#{k}(#{m[[g,a]]})"
e=(c-t).abs
if e<d
d=e
f=m[[c,p]]
return f if d==0
end}}}
b[p]=o}}}
f
end
