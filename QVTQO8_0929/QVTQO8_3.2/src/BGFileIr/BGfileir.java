package BGFileIr;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;




public class BGfileir {

	public static void main(String[] args) throws IOException {
		System.out.println("Kerem adja meg a bekerni kivant adatok szamat!");
		Scanner sc1 = new Scanner(System.in);
		int szam = sc1.nextInt();
		System.out.println("Adatok szama = " + szam);

		ArrayList<Integer> list = new ArrayList<Integer>(szam);
		
		Scanner sc2 = new Scanner(System.in);
		for (int i = 0; i < szam - 1; i++) {
			System.out.print((i) + ". Adat = ");
			int ertek = sc2.nextInt();
			list.add(ertek);
			
		}
		
		int lastertek = sum(list);
		list.add(lastertek);
		System.out.println();
		System.out.println((szam-1) + ". Adat = " + lastertek);
		System.out.println();
		
		List<String> strings = list.stream().map(Object::toString)
                .collect(Collectors.toList());
		
		
		System.out.println("Adatok kiirasa a bartokgabor.txt allomanyba");
		FileWriter writer = new FileWriter("bartokgabor.txt"); 
		for(String str: strings) {
		  writer.write(str + System.lineSeparator());
		}
		writer.close();
		
		try {
		      File myObj = new File("bartokgabor.txt");
		      Scanner myReader = new Scanner(myObj);
		      while (myReader.hasNextLine()) {
		        String data = myReader.nextLine();
		        System.out.println(data);
		      }
		      myReader.close();
		    } catch (FileNotFoundException e) {
		      System.out.println("Hiba tortent.");
		      e.printStackTrace();
		    }
			
	}
	
	
	public static int sum(List<Integer> list) {
	    int sum = 0;
	    for (int i: list) {
	        sum += i;
	    }
	    return sum;
	}

}
