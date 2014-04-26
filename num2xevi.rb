require "smalruby"

desktop = Canvas.new

n = gets.to_i

desktop.on(:start) do
  n = n.to_s(2)
  while (n.length % 4) != 0
    n = "0" + n
  end
p n
  h = []
  while /(....)/ =~ n do
    h << $~[1]
    n[0, 4] = ""
  end
p h
  zeros = []
  ones = []
  twos = []
  fours = []
  eights = []
  
  h.each_with_index do |ns, i|
    x = i * 100
    zero1 = line(left: 94 + x, top: 2, right: 2 + x, bottom: 94)
    zero2 = line(left: 95 + x, top: 3, right: 3 + x, bottom: 95)
    zero3 = line(left: 96 + x, top: 4, right: 4 + x, bottom: 96)
    zeros << zero1
    zeros << zero2
    zeros << zero3
    if /...1/ =~ ns
      one = box_fill(x1: 0 + x, y1: 95,x2: 98 + x, y2: 98,color: "white")
      ones << one
    end
    if /..1./ =~ ns
      two = box_fill(x1: 95 + x, y1: 0,x2: 98 + x, y2: 98,color: "white")
      twos << two
    end
    if /.1../ =~ ns
      four = box_fill(x1: 0 + x, y1: 0,x2: 98 + x, y2: 3,color: "white")
      fours << four
    end
    if /1.../ =~ ns
      eight = box_fill(x1: 0 + x, y1: 0,x2: 3 + x, y2: 98,color: "white")
      eights << eight
    end
  end
end