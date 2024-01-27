package blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class deleteArticleServlet
 */
@WebServlet(urlPatterns = "/deleteArticle")
public class DeleteArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Récuperer l'instance de ArticleDAO depuis le context d'applicarion 
		ArticleDAO articleDAO = (ArticleDAO) getServletContext().getAttribute("articleDAO");
		
		try {
			//Récupérer l'Id de l'Article depuis le parametre de la requete
			int articleId = Integer.parseInt(request.getParameter("id"));
			
			//Recherche du produit par son ID
			Article article = articleDAO.getArticleById(articleId);
			
			//supprimer l'article de la liste des articles 
			articleDAO.deleteArticle(article);
			
			response.sendRedirect("index.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
