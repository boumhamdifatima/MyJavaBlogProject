package blog;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class ArticleDAO {
	//Liste pour stocker les articles
	private List<Article> articles = new ArrayList<Article>();
	private int ArticlesCount = 1;
	private int CommentaireCount = 1;
	
	/**
	 * @return la liste des articles
	 */
	public List<Article> getArticles() {
		return articles;
	}
	
	/**
	 * @param Article l'article à ajouter
	 * */
	public void addArticle(Article article) {
		article.setId(ArticlesCount++);
		Date date = new Date();
		article.setCreateDate(date);
		article.setUpdateDate(date);
		articles.add(article);
	}
	
	/**
	 * @param id l'Id de l'article à rechercher
	 * @return Article l'article trouvé, ou null si aucun article trouvé
	 * */
	public Article getArticleById(int id) {
		for (Article article : articles) {
			if (article.getId() == id) {
				return article;
			}
		}
		return null;
	}
	
	/**
	 * @param category la chaine de caractere a rechercher dans les categories des articles
	 * @return une liste d'articles dont la categorie contient la chaine de caracteres recherché
	 * */
	public List<Article> searchArticlesByCategory(String category) {
		List<Article> result = new ArrayList<Article>();
		for (Article article : articles) {
			if (article.getCategory().toLowerCase().contains(category.toLowerCase())) {
				result.add(article);
			}
		}
		return result;
	}
	
	/**
	 * @param Commentaire à ajouter à l'article
	 * */
	public void addCommentToArticle(Commentaire commentaire, Article article) {
		int indexOfArticle = articles.indexOf(article);
		commentaire.setId(CommentaireCount++);
		Date date = new Date();
		commentaire.setCreatDate(date);
		List<Commentaire> comments = article.getCommenataires();
		comments.add(commentaire);
		article.setCommenataires(comments);
		articles.set( indexOfArticle , article);
	}
	
	/**
	 * @param Article l'article à supprimer
	 * */
	public void deleteArticle(Article article) {
		int indexOfArticle = articles.indexOf(article);
		articles.remove(indexOfArticle);
	}
}
