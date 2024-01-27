/**
 * 
 */
package blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Servlet implementation class AddArticleServlet
 */
@WebServlet(urlPatterns = "/addArticle")
public class AddArticleServlet extends jakarta.servlet.http.HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArticleDAO articleDAO = (ArticleDAO) getServletContext().getAttribute("articleDAO");
		
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String image = request.getParameter("image");
		
		Article article = new Article(0, title, category, description, image, null, null);
		
		articleDAO.addArticle(article);
		
		response.sendRedirect("index.jsp");
	}

}
