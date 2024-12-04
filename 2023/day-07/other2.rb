hands = File.read('input.txt').split("\n").map{|h| h.split(" ")}

def rank(a)
  if a.include?('J') and a != 'JJJJJ'
    highest = a.delete('J').chars.tally.max_by{|k,v| v}[0]
    a = a.gsub('J', highest)
  end
  a.chars.tally.values.sort.reverse
end

def value(a)
  vals = ['J', *(2..9).map{_1.to_s}, 'T', 'Q', 'K', 'A']
  a.chars.map{|c| vals.index(c)}
end

hands = hands.sort do |a, b|
  [rank(a[0]), value(a[0])] <=> [rank(b[0]), value(b[0])]
end

p hands.each_with_index.map{|h, i| (i+1) * h[1].to_i}.sum
