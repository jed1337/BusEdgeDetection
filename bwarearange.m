function image = bwarearange(I, LB, UB)
   image = xor(bwareaopen(I,LB),  bwareaopen(I,UB));
end 