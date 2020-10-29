
import java.io.File;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.util.Calendar;

public aspect Log {	
	File file = new File("Log.txt");
	Calendar cal= Calendar.getInstance();
	pointcut success(): call(* *.moneyWithdrawal()); 
    after() : success() {
    	try {
    	if (!file.exists()) {
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file,true);
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write("Su retiro se ha realizado correctamente "+ cal.getTime()+"\n");
        bw.close();
        }
    	catch(Exception e) {}
    	System.out.print("Error");
    } 
    pointcut successTransaction(): call(* *.moneyMakeTransaction()); 
    after() : successTransaction() {
    	try {
    	if (!file.exists()) {
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file,true);
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write("Transaccion exitosa "+ cal.getTime()+"\n");
        bw.close();}
    	catch(Exception e) {}
    	System.out.print("Error");
    } 
}  


