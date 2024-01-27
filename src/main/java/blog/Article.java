package blog;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Article {
	private int id;
	private String title;
	private String category;
	private String description;
	private String image;
	private Date createDate;
	private Date updateDate;
	private List<Commentaire> commenataires;
	
	//Constructeur à partir de la la super classe
	public Article() {
		super();
	}

	//Constructeur avec tous les attributs
	public Article(int id, String title, String category, String description, String image, Date createDate, Date updateDate) {
		super();
		this.id = id;
		this.title = title;
		this.category = category;
		this.description = description;
		this.image = image;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.commenataires = new ArrayList<Commentaire>();
	}
	
	//les getters et les setters de tous les attributs
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public List<Commentaire> getCommenataires() {
		return commenataires;
	}

	public void setCommenataires(List<Commentaire> commenataires) {
		this.commenataires = commenataires;
	}
	
	//add one Commentaire to liste of Commentaires
	public void addCommenataireToList(Commentaire commenataire) {
		this.commenataires.add(commenataire);
	}
	
	//Redéfinir la méthode toString
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", category=" + category + ", description=" + description 
				+ ", updateDate=" + updateDate + ", Count of commenataires=" + commenataires.size() + "]";
	}
	
}
