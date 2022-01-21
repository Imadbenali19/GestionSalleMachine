package tests;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import entities.Machine;
import entities.User;
import services.MachineService;
import services.SalleService;
import services.UserService;

public class Test {

	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		MachineService ms=new MachineService();
		SalleService ss=new SalleService();
//		List<Machine> machines =ms.findMachineBetween2Dates(new Date(sdf.parse("2022-08-11").getTime()), new Date(sdf.parse("2022-09-25").getTime()));
//		//List<Machine> machines =ms.findAll();
//		if(machines.isEmpty()) {
//			System.out.println("Empty");
//		}else {
//			for(Machine m: machines) {
//				System.out.println(m);
//			}
//		}
		
//		UserService us=new UserService();
//		List<String> users=us.NbMachinePerSalle();
//		for(String m: users) {
//			System.out.println(m);
//		}
		
		ms.create(new Machine("aa", "ddd",new Date(sdf.parse("2022-08-11").getTime()), ss.findById(1),145));
		System.out.println(ms.findAll());
	}

}
