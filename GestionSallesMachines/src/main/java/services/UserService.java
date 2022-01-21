package services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connexion.Connexion;
import doa.Idoa;
import entities.User;

public class UserService implements Idoa<User> {

	public boolean create(User o) {
        int nb_updates = 0;
        try {
            String query = "insert into user values (null,?,?,?);";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            statement.setString(1, o.getLogin());
            statement.setString(2, o.getPassword());
            statement.setInt(3, o.getIsAdmin());
            nb_updates = statement.executeUpdate();

            if (nb_updates != 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(User o) {
        int nb_updates = 0;
        try {
            String query = "update user set login=?,password=?, isAdmin=? where id=?;";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            statement.setString(1, o.getLogin());
            statement.setString(2, o.getPassword());
            statement.setInt(3, o.getIsAdmin());
            statement.setInt(4, o.getId());
            nb_updates = statement.executeUpdate();

            if (nb_updates != 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(User o) {
        int nb_updates = 0;
        try {
            String query = "delete from user where id=?;";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            statement.setInt(1, o.getId());
            nb_updates = statement.executeUpdate();

            if (nb_updates != 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User findById(int id) {
        ResultSet rs = null;
        try {
            String query = "select * from user where id=?;";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();

            if (rs.next()) {
                return new User(rs.getInt("id"),rs.getString("login"), rs.getString("password"),rs.getInt("isAdmin"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> findAll() {
        ResultSet rs = null;
        List<User> users = new ArrayList<User>();
        try {

            String query = "select * from user";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt("id"),rs.getString("login"), rs.getString("password"),rs.getInt("isAdmin")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    
    public int getNbUser() {
        ResultSet rs = null;
        int x=0;
        try {

            String query = "select count(*) as nb from user";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                x=rs.getInt("nb");
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;
    }
    
    public int getNbSalle() {
        ResultSet rs = null;
        int x=0;
        try {

            String query = "select count(*) as nb from salle";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                x=rs.getInt("nb");
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;
    }
    
    public int getNbMachine() {
        ResultSet rs = null;
        int x=0;
        try {

            String query = "select count(*) as nb from machine";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                x=rs.getInt("nb");
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return x;
    }
    
    public List<String> NbMachinePerSalle() {
        ResultSet rs = null;
        int x=0;
        List<String> result=new ArrayList<String>();
        try {

            String query = "select count(*) as nb,s.code as salle from machine m,salle s where m.idSalle=s.id group by s.code;";
            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                result.add(rs.getInt("nb")+"_"+rs.getString("salle"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
