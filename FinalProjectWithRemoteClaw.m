global key
InitKeyboard();

done = false;
person = false;


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
    
     %---------------------------------- Code for RED ----------------------------------
   if color == 5
       brick.beep();
       brick.StopMotor('BC');
       pause(3);
   end
   
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
 
   
   %Code for BLUE
   if color == 2 && person == false
       brick.StopMotor('BC');
       while 1
           pause(0.1);
          if key == 'f'
             brick.beep();
             brick.MoveMotor('BC', 20);
             pause(1);
             person = true;
             break; 
          end
          if key == 'w'
              brick.MoveMotor('BC', 50);
              pause(0.1);
              brick.StopMotor('BC')
          end
          if key == 'a'
              brick.MoveMotor('B', 25);
              brick.MoveMotor('C', -25);
              pause(0.1);
              brick.StopMotor('BC');
          end
          if key == 's'
              brick.MoveMotor('BC', -50);
              pause(0.1);
              brick.StopMotor('BC');
          end
          if key == 'd'
              brick.MoveMotor('B', -25);
              brick.MoveMotor('C', 25);
              pause(0.1);
              brick.StopMotor('BC');
          end
          if key == 'e'
              brick.MoveMotor('A', 25);
              pause(0.5);
              brick.StopMotor('BC');
          end
          if key == 'r'
              brick.MoveMotor('A', -25);
              pause(0.5);
              brick.StopMotor('A');
          end
       end
       
   end
   
      %Code for GREEN
   if color == 3 && person == true
       brick.StopMotor('BC');
       while 1
           pause(0.1);
          if key == 'f'
             brick.beep();
             brick.MoveMotor('BC', 20);
             pause(1);
             person = true;
             break; 
          end
          if key == 'w'
              brick.MoveMotor('BC', 50);
              pause(0.1);
              brick.StopMotor('BC')
          end
          if key == 'a'
              brick.MoveMotor('B', 25);
              brick.MoveMotor('C', -25);
              pause(0.1);
              brick.StopMotor('BC');
          end
          if key == 's'
              brick.MoveMotor('BC', -50);
              pause(0.1);
              brick.StopMotor('BC');
          end
          if key == 'd'
              brick.MoveMotor('B', -25);
              brick.MoveMotor('C', 25);
              pause(0.1);
              brick.StopMotor('BC');
          end
          if key == 'e'
              brick.MoveMotor('A', 25);
              pause(0.5);
              brick.StopMotor('BC');
          end
          if key == 'r'
              brick.MoveMotor('A', -25);
              pause(0.5);
              brick.StopMotor('A');
          end
       end
       
   end
   
   
 % ---------------------------------- Stop Program -----------------------
    if(key == 'g')
        brick.StopMotor('BC')
        break;
    end
       
end