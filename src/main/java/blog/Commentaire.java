package blog;

import java.util.Date;

public class Commentaire {
	private int id;
	private String name;
	private String comment;
	private Date creatDate;
	
	//Constructeur à partir de la la super classe
	public Commentaire() {
		super();
	}
	
	//Constructeur avec tous les attributs
	public Commentaire(int id, String name, String comment, Date creatDate) {
		super();
		this.id = id;
		this.name = name;
		this.comment = comment;
		this.creatDate = creatDate;
	}
	
	//les getters et les setters de tous les attributs
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}
	
	//Redéfinir la méthode toString
	@Override
	public String toString() {
		return "Commentaire [id=" + id + ", name=" + name + ", comment=" + comment + ", creatDate=" + creatDate + "]";
	}
	
	
}
