global key
InitKeyboard();

done = false;
person = false;
redCounter = 0;
turnCounter = 0;

while 1
 
    %initialize variables
    readingFrontTouch = brick.TouchPressed(2);
    readingRightTouch = brick.TouchPressed(4);
    leftDistance = brick.UltrasonicDist(1);
    color = brick.ColorCode(3);
    disp(color);
    if (redCounter > 0)
        temp = redCounter;
        redCounter = temp - 1;
    end
    
    if (turnCounter > 0)
        temp = turnCounter;
        turnCounter = temp - 1;
    end
    
    disp(readingFrontTouch);
    brick.MoveMotor('BC', 50);
    pause(0.1);
    
     % ---------------------------------- Stop Program -----------------------
    if(key == 'g')
        brick.StopMotor('BC')
        break;
    end
    
     %---------------------------------- Code for RED ----------------------------------
   if color == 5 && redCounter == 0
       brick.beep();
       brick.StopMotor('BC');
       pause(3);
       redCounter = 5;
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
   
     %---------------------------------- Distance ----------------------------------  
  
  %turn into openings
  if leftDistance > 50 && turnCounter == 0
    brick.MoveMotor('BC', 50);
    pause(1.3);
    brick.StopMotor('BC');
    pause(1.5);
    brick.MoveMotor('B', -42);
    brick.MoveMotor('C', 42);
    pause(1);
    %i = 0;
    %while i < 15
        %brick.MoveMotor('BC', 50);
        %pause(0.1);
        %disp(color);
        %if color == 5 && redCounter == 0
        %    brick.beep();
         %   brick.StopMotor('BC');
          %  pause(3);
           % redCounter = 5;
        %end
        %temp = i;
        %i = temp + 1;
    %end
    brick.beep;
    turnCounter = 7;
  end
  
  %too close to wall
  if leftDistance < 10       %sometimes 7
    brick.StopMotor('BC');
    pause(0.1);
    brick.MoveMotor('B', -50);
    pause(1);
    brick.StopMotor('B');
    brick.MoveMotor('C', -50);
    pause(1);
    brick.MoveMotor('BC', 50);
    pause(1.5);     %sometimes 2.0

  end
  

    %---------------------------------- Touch ----------------------------------
    
    %front touch
    if readingFrontTouch
        brick.beep();
        brick.StopMotor('BC');
        brick.MoveMotor('BC', -30);
        pause(2.7);         %usually 1.0
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
    
end