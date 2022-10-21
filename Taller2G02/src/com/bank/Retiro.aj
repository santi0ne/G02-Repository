package com.bank;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;

public aspect Retiro {
	
	pointcut success() : call(* moneyWith*(..) );
    after() : success() {
    	
    	
    	StringBuilder sb= new StringBuilder();
        try (BufferedWriter bufferedW = new BufferedWriter(new FileWriter("Log.txt",true))) {
            
            sb.append("--Retiro realizado--Hora:");  
            sb.append(LocalDateTime.now().getHour()+":"+LocalDateTime.now().getMinute()+":"+LocalDateTime.now().getSecond()+"--");
            sb.append("\n");
            bufferedW.write(sb.toString());
        } catch (IOException e) {
            System.out.println(e);
        }
        
    	System.out.println("**** Retiro completado ****");
    		
    }

}
