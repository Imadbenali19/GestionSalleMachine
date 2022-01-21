package tests;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import connexion.Connexion;


public class TestCreation {

	public static void main(String[] args) {
		

		try {
			String createTSalle="create table salle ("
					+"id int primary key auto_increment,"
					+"code varchar(50),"
					+"type varchar(50)"
					+ ");";
			
			String createTMachine="create table Machine ("
					+"id int primary key auto_increment,"
					+"reference varchar(30),"
					+"marque varchar(50),"
					+"dateAchat date,"
					+"prix double,"
					+"idSalle int,"
					+"constraint fk_1 foreign key(idSalle) references salle (id) on delete cascade on update cascade"
					+ ");";
			
			String createTUser="create table user ("
					+"id int primary key auto_increment,"
					+"login varchar(50),"
					+"password varchar(50),"
					+"isAdmin int default 0"
					+ ")";
			
			Statement statement=Connexion.getInstane().getConnection().createStatement();
			
			statement.execute("drop table if exists machine");
			statement.execute("drop table if exists salle");
			statement.execute("drop table if exists user");
			
			statement.executeUpdate(createTSalle);
			statement.executeUpdate(createTMachine);
			statement.executeUpdate(createTUser);
			
			String admin="insert into user values (null,?,?,?)";

			PreparedStatement statementInsert=Connexion.getInstane().getConnection().prepareStatement(admin);
			statementInsert.setString(1, "admin");
			statementInsert.setString(2, "admin");
			statementInsert.setInt(3, 1);
			int nb_updates=statementInsert.executeUpdate();
			if(nb_updates!=0) {
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
