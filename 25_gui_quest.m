# Question Dialog
#
# Display msg using a question dialog box and return the caption of the activated button. 

btn = questdlg ("Close Octave?", "Some fancy title", ...
                "Yes", "No", "No");

if (strcmp (btn, "Yes"))
  exit ();
endif