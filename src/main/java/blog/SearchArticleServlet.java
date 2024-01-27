package blog;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchArticleServlet
 */
@WebServlet(urlPatterns = "/searchArticle")
public class SearchArticleServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recuperer l'instance di articleDAO
		ArticleDAO articleDAO = (ArticleDAO) getServletContext().getAttribute("articleDAO");
		
		//recuperer la categorie pour la recherche
		String category = request.getParameter("category");
		
		//Rechercher les articles correspondant à la categorie
		List<Article> articles = articleDAO.searchArticlesByCategory(category);
		
		//Ajouter la liste des articles prouvés en tant qu'attribut de la requete
		request.setAttribute("articles", articles);
		request.setAttribute("category", category);
		
		//transfert de la requete ey de la reponse à la page JSP pour afficher les resultats
		request.getRequestDispatcher("/searchArticle.jsp").forward(request, response);
	}
}
