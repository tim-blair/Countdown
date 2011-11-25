require'set'
def h t,n
d=t;r=0;f=''
return[t,t]if n.include? t
m={};u=%w(+ - * /);b={};n.each{|i|b[[i]]=Set.new [i];m[[i,[i]]]=i.to_s}
(2..n.size).each{|i|n.permutation(i).to_a.uniq.each{|p|(1..p.size-1).each{|s|l=p.slice(0...s);a=p.slice(s..-1);o=Set.new;b[l].each{|q|u.each{|k|b[a].each{|g|next if k=='/'&&q%g!=0;c=q.send(k,g);next if c==0;o.add(c);m[[c,p]]="(#{m[[q,l]]})#{k}(#{m[[g,a]]})";e=(c-t).abs
if e<d;d=e;r=c;f=m[[c,p]];return[t,f]if d==0;end}}};b[p]=o}}};[r,f]
end
