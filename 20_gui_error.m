# Error Dialog

clear all;
clc;

errordlg ("Some fancy error occurred.");
errordlg ("Some fancy error\nwith two lines.");
errordlg ({"Some fancy error", "with two lines."});
errordlg ("Some fancy error occurred.", "Fancy caption");