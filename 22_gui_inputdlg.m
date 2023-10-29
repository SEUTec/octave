# Input Dialog to intro numeric values
clear all;
clc;

prompt = {"Width", "Height", "Depth"};
defaults = {"1.10", "2.20", "3.30"};
rowscols = [1; 1; 1];
dims = inputdlg (prompt, "Enter Box Dimensions", ...
                 rowscols, defaults);
dims