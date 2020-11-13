function b = magn (a, varargin)
%MAGN   Magnitude (or Euclidian norm) of vectors.

b = sum(conj(a).*a, varargin{:}); 
b = sqrt (b);