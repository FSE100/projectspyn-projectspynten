global key
InitKeyboard();

done = false;


while 1
    %initialize variables
    readingFrontTouch = brick.TouchPressed(2);
    readingRightTouch = brick.TouchPressed(4);
    leftDistance = brick.UltrasonicDist(1);
    color = brick.ColorCode(3);
    disp(color);
    
    disp(readingFrontTouch);
    brick.MoveMotor('BC', 50);
    pause(0.1);
    
    %---------------------------------- Touch ----------------------------------
    
    %front touch
    if readingFrontTouch
        brick.beep();
        brick.StopMotor('BC');
        brick.MoveMotor('BC', -30);
        pause(1);
        brick.StopMotor('BC');
        brick.MoveMotor('B', 42);
        brick.MoveMotor('C', -42);
        pause(1);
        brick.StopMotor('BC');
    end
    
    %right touch
    if readingRightTouch
       brick.beep();
       brick.StopMotor('BC');
       brick.MoveMotor('B', -55);
       brick.MoveMotor('C', -20);
       pause(1);
       brick.StopMotor('BC');
    end  
    
  %---------------------------------- Distance ----------------------------------  
  
  %turn into openings
  if leftDistance > 50
    brick.MoveMotor('BC', 50);
    pause(1.3);
    brick.StopMotor('BC');
    pause(1.5);
    brick.MoveMotor('B', -42);
    brick.MoveMotor('C', 42);
    pause(1);
    brick.MoveMotor('BC', 50);
    pause(1.5);
  end
  
  %too close to wall
  if leftDistance < 10
    brick.StopMotor('BC');
    pause(0.1);
    brick.MoveMotor('B', -50);
    pause(1);
    brick.StopMotor('B');
    brick.MoveMotor('C', -50);
    pause(1);
    brick.MoveMotor('BC', 50);
    pause(1.5);

  end
  
 % ---------------------------------- Color ----------------------------------
  
   %Code for RED
   if color == 5
       brick.beep();
       brick.StopMotor('BC');
       pause(3);
   end  
   
    if(key == 'f')
        brick.StopMotor('BC')
        break;
    end
       
end