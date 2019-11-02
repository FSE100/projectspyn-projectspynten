
done = false;

while (done == false)
    
%---------------------------------- color ---------------------------------    
    brick.SetColorMode(3, 2);
    brightness = brick.LightReflect(2);
    color = brick.ColorCode(1);  % Get color on port D.
    switch color   % Switch statement for color.
        case '3'
            brick.StopMotor('BC');
            brick.beep();
        case '2'
            brick.StopMotor('BC');
            brick.beep();
        case '5'
            brick.StopMotor('BC');
            brick.beep();
    end
%----------------------------------- movement------------------------------
    distanceLeft = brick.UltrasonicDist(1);
    display(distanceLeft);
    readingFrontTouch = brick.TouchPressed(2);
    readingRightTouch = brick.TouchPressed(4);
    
    if readingFrontTouch
        brick.beep();     % Beep if the sensor was touched.
                
    end
    
    if readingRightTouch
        brick.beep();     % Beep if the sensor was touched.
   
    end

    if distanceLeft < 20
        brick.MoveMotor('BC', 50);
         
    else
        brick.StopMotor('BC')
    end
    
    
    
    
    
end


