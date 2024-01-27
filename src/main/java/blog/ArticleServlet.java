package blog;

import java.io.IOException;

import jakarta.servlet.AsyncContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet(urlPatterns = "/article", asyncSupported = true)
public class ArticleServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Demarrage du contexte asynchrone
		AsyncContext asynContext = request.startAsync();
				
		//Récuperer l'instance de ArticleDAO depuis le context d'applicarion au lieu de créer une nouvelle instance
		ArticleDAO articleDAO = (ArticleDAO) getServletContext().getAttribute("articleDAO");
		
		//Traitement asynchrone de la requete
		asynContext.start(() -> {
			try {
				//Récupérer l'Id de l'Article depuis le parametre de la requete
				int articleId = Integer.parseInt(request.getParameter("id"));
				
				//Recherche du produit par son ID
				Article article = articleDAO.getArticleById(articleId);
				
				//Ajout du produit en tant qu'attribut de la requete
				request.setAttribute("article", article);
				
				//Dispatch de la requete vers la page jsp pour affichage des details du produit
				asynContext.dispatch("/articleDetails.jsp");
				
			} catch (Exception e) {
				// Gestion des erreurs potentielles lors du traitement asynchrone
				e.printStackTrace();
				asynContext.complete();
			}
		});
				
	}
}
