readChId = 2349977;
writeChId = 2349977;
readKey = 'GOOTZORSIYFDUPP9';
writeKey = 'KTTPUOISXY6Q7E4I';
[data,time] = thingSpeakRead(readChId,'Fields',[1, 2, 3, 4, 5, 7],'ReadKey',readKey)
t=data(1)
h=data(2)
u=data(3)
t_h = 78;
t_l = 62;
h_h = 65;
u_h =100;
dt=timeofday(time)

if dt>duration(7,0,0) && dt<duration(17,0,0)
    d = 1
else
    d = 0
end

if (d ==1 && u<u_h)
   b=1;
else
   b=0;
end

if t >t_h
    AC = 1;
    Heater = 0;
    RHED = 0;
        
else
    AC = 0;
    if h>h_h
        RHED=1;
    else
        RHED=0;
    end
    if t>t_l
        Heater = 0;        
    else
        Heater = 1;
        if (d ==1 && u>u_h)
            b = 1;
        else b = 0;
        end 
    end
    
end
 AC
 Heater
 b
 RHED  
thingSpeakWrite(writeChId,[t,h,u,AC,Heater,b,RHED],'Fields',[1,2,3,4,5,6,7],'Writekey',writeKey);