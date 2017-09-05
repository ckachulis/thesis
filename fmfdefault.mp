% fmfdefault.mp -- do not edit, generated automatically by thesis.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 150*1.0pt#, 150*1.0pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=1.0pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
vleft (__i1, __i2);
vright (__o1, __o2);
vlabel ("$q$", __i1);
vlabel ("$q$", __o1);
vlabel ("$\chi $", __i2);
vlabel ("$\chi $", __o2);
vconnect ("fermion", __i1, __v1);
vconnect ("fermion", __v2, __o1);
vconnect ("dots, label=$~q$", __v1, __v2);
vconnect ("plain", __i2, __v1);
vconnect ("plain", __v2, __o2);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
