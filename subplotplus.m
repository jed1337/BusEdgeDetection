function subplotplus(Icell)
   len = length(Icell);
   dim = ceil(sqrt(len));

   figure;
   for idx=1:len         
      subplot(dim, dim, idx);
      imshow(Icell{idx});
   end
end