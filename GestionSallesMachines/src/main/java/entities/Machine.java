package entities;

import java.util.Date;

public class Machine {
	
	private int id;
	private String reference;
	private String marque;
	private Date dateAchat;
	private double prix;
	private Salle salle;
	
	
	public Machine(String reference, String marque, Date dateAchat,Salle salle,double prix) {
		super();
		this.reference = reference;
		this.marque = marque;
		this.dateAchat = dateAchat;
		this.salle=salle;
		this.prix=prix;
	}
	public Machine(int id, String reference, String marque, Date dateAchat,Salle salle,double prix) {
		super();
		this.id = id;
		this.reference = reference;
		this.marque = marque;
		this.dateAchat = dateAchat;
		this.salle=salle;
		this.prix=prix;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getReference() {
		return reference;
	}


	public void setReference(String reference) {
		this.reference = reference;
	}


	public String getMarque() {
		return marque;
	}


	public void setMarque(String marque) {
		this.marque = marque;
	}


	public Date getDateAchat() {
		return dateAchat;
	}


	public void setDateAchat(Date dateAchat) {
		this.dateAchat = dateAchat;
	}


	public Salle getSalle() {
		return salle;
	}


	public void setSalle(Salle salle) {
		this.salle = salle;
	}
	
	
	public double getPrix() {
		return prix;
	}
	
	
	public void setPrix(double prix) {
		this.prix = prix;
	}
	
	
	@Override
	public String toString() {
		return "Machine [id=" + id + ", reference=" + reference + ", marque=" + marque + ", dateAchat=" + dateAchat
				+ ", prix=" + prix + ", salle=" + salle + "]";
	}


	
}
