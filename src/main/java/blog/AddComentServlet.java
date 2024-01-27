package blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AddComentServlet
 */
@WebServlet(urlPatterns = "/addComment")
public class AddComentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Récuperer l'instance de ArticleDAO depuis le context d'applicarion au lieu de créer une nouvelle instance
		ArticleDAO articleDAO = (ArticleDAO) getServletContext().getAttribute("articleDAO");
		
		try {
			
			int idArticle = Integer.parseInt(request.getParameter("article_id"));
			String nom = request.getParameter("name");
			String commentaire = request.getParameter("comment");
			
			Commentaire comment = new Commentaire(0, nom, commentaire, null);
			
			Article article = articleDAO.getArticleById(idArticle);
			
			articleDAO.addCommentToArticle(comment, article);
			
			article = articleDAO.getArticleById(idArticle);
			
			//Ajout du produit en tant qu'attribut de la requete
			request.setAttribute("article", article);
			
			response.sendRedirect("article?id="+idArticle);//utilisation de la servlet ArticleServlet
			
			
			/**La redirection suivante ne fonctionne pas car en utilisant response.sendRedirect, il envoie 
			 * une nouvelle requête au navigateur avec la nouvelle URL. Cela signifie que toutes les données 
			 * de la requête précédente (y compris les attributs) sont perdues. C'est pourquoi, 
			 * lorsque on essaye d'accéder à l'attribut "article" dans fichier JSP, il était null.
			 * */
			//response.sendRedirect(request.getContextPath() + "/articleDetails.jsp");	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
					
					
		
	}
}
