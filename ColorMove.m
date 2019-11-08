%2 = blue, 0 = no color, 3 = green, 5 = red
global key
InitKeyboard();

brick.SetColorMode(3,2);

while 1
   color = brick.ColorCode(3);
   disp(color);
   brick.MoveMotor('BC', 20);
    pause(0.1);
   
   %Code for RED
   if color == 5
       brick.beep();
       brick.StopMotor('BC');
       pause(3);
   end    
   
%    code for BLUE
   if color == 2
    

if(key == 'f')
        brick.StopMotor('BC')
        break;
end
end