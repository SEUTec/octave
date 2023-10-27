# How show data on the console in Octave
clear

number = 34.36;
string = "Resultado:"

printf("printf\n");
disp("disp\n");

#printf(number);   #  printf: format TEMPLATE must be a string
printf("%.3f\n", number);

disp(number);
disp(string);
disp([string, ' ', num2str(number)]);

