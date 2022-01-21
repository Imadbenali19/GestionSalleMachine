package entities;

public class User {

	private int id;
    private String login;
    private String password;
    private int isAdmin = 0;

    
    public User(int id, String login, String password,int isAdmin) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.isAdmin=isAdmin;
    }

    public User(String login, String password,int isAdmin) {
        this.login = login;
        this.password = password;
        this.isAdmin=isAdmin;
    }
    
    
    public void setId(int id) {
        this.id = id;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", login=" + login + ", password=" + password + ", isAdmin=" + isAdmin + "]";
	}

   
}
