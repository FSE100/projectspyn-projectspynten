global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotor('B',50);
            brick.MoveMotor('C',50);
                pause(2);
            brick.StopMotor('B');
            brick.StopMotor('C');
        case 'downarrow'
            brick.MoveMotor('BC',-50);
                pause(1);
            brick.StopMotor('B');
            brick.StopMotor('C');
        case 'leftarrow'
                brick.GyroAngle(3);
                resetRotationAngle(mygyro);
                count = 0;
                angle = 0;
            while (angle >= -90 || count < 2)
                disp(angle);
                brick.MoveMotor('B',-50);    %right motor   
                brick.MoveMotor('C',50);   %left motor
                angle = readRotationAngle(mygyro);
                disp(angle);
                count = count + 1;
            end
                brick.StopMotor('B');
                brick.StopMotor('C');
                
        case 'rightarrow'
                brick.GyroCalibrate(3);
                angle = 0;
                count = 0;
            while (angle >= 90 || count < 2)
                disp(angle);
                brick.MoveMotor('B',50);    %right motor   
                brick.MoveMotor('C',-50);   %left motor
                angle = brick.GyroAngle(3);
                disp(angle);
                count = count + 1;
            end
                brick.StopMotor('B');
                brick.StopMotor('C');
                brick.GyroCalibrate(3);
        case 'w'
                brick.MoveMotor('A', -10);
                pause(1);
                brick.StopMotor('A');
               
    end
end
            
            
         
            
                

