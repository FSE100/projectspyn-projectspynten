global key
InitKeyboard();
obj = Movement;

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotor('B',50);
            brick.MoveMotor('C',50);
                 
        case 'downarrow'
            brick.MoveMotor('BC',-50);
               
        case 'leftarrow'
            brick.MoveMotor('B',-45);
            brick.MoveMotor('C',45);
                 
        case 'rightarrow'
            brick.MoveMotor('C',-45);
            brick.MoveMotor('B',45);
                
        case 'w'
            brick.MoveMotor('A', -15);
            pause(1.5);
            brick.StopMotor('A');
            
        case 's'
            brick.MoveMotor('A', 20.5);
            pause(1);
            brick.StopMotor('A'); 
            
        case 'l'
            brick.StopMotor('BC');
    end
end
            
            
         
            
                

