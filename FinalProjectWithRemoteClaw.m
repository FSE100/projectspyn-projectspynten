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
    
     %---------------------------------- Code for RED ---------------------
   if color == 5
   % if the color sensor senses red, then the car will stop for 3 seconds
       brick.beep();
       brick.StopMotor('BC');
       pause(3);
   end
   
    %---------------------------------- Touch -----------------------------
    
    %front touch
    if readingFrontTouch
    % if the front touch sensor is pressed, the vehicle will backup
    % and make a 90 degree turn right
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
    % if the right touch sensor is pressed, the vehicle will adjust 
    % off of the wall by backing up to the left and the straightening out
       brick.beep();
       brick.StopMotor('BC');
       brick.MoveMotor('B', -55);
       brick.MoveMotor('C', -20);
       pause(1);
       brick.StopMotor('BC');
    end  
    
  %---------------------------------- Distance ---------------------------- 
  
  %turn into openings
  if leftDistance > 50
  % if the distance from the ultrasonic sensor to the wall is greater than
  % 50cm then the robot will move forward a little while to get into the
  % center of the square, take a left turn, and then drive forward so it
  % can clear the wall previous of it.
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
  % if the distance from the ultasonic sensor is less than 10cm from the
  % wall, the the robot will adjust from the wall by moving back-right and
  % then straightening up after.
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
  
 % ---------------------------------- Color -------------------------------
 
   
   %Code for BLUE
   if color == 2 && person == false
   % if the color is blue, then it will trigger the keyboard so we can pick
   % up the passenger with our controller. Once this runs once, then it
   % will make "person == true", so this if statement wont run twice.
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
   % if the color sensor hits green before it hits blue, then this if
   % statement will not run. If the color sensor hits blue first, then hits
   % blue, this if statement will run. This will promt the user to use the
   % controller to drop the passenger off safely
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
   
   
 % ---------------------------------- Stop Program ------------------------
    if(key == 'g')
    % if 'g' is pressed, stop the robot
        brick.StopMotor('BC')
        break;
    end
       
end