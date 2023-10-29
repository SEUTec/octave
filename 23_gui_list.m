# List Dialog

my_options = {"An item", "another", "yet another"};
[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Multiple");
if (ok == 1)
  disp ("You selected:");
  for i = 1:numel (sel)
    disp (sprintf ("\t%s", my_options{sel(i)}));
  endfor
else
  disp ("You cancelled.");
endif