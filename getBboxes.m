function bBoxes = getBboxes(I)
   s = regionprops(I, 'BoundingBox');
   bBoxes={s(:).BoundingBox};
end