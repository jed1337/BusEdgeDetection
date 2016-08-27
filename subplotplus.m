function subplotplus(Icell)
   len = length(Icell);
   dim = ceil(sqrt(len));

   if len>0
      figure;
      for idx=1:len         
         subplot(dim, dim, idx);
         imshow(Icell{idx});
      end
   else
      fprintf('Candidate length is 0');
   end
end