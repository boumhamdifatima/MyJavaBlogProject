<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="blog.Article" %>
<%@ page import="blog.Commentaire" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="blog.ArticleDAO" %>

<%
	ArticleDAO articleDAO = (ArticleDAO) application.getAttribute("articleDAO");
	Article article =  (Article) request.getAttribute("article");
%>

<% 	// Créez un objet SimpleDateFormat avec le format souhaité 
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
 %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="url('https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js')"></script>
<title>Détail Article</title>
</head>
<body>
	<header>
	<!-- Responsive navbar-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="index.jsp">Mon Blog Bijoux</a>
		        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
		        <div class="collapse navbar-collapse" id="navbarSupportedContent">
		            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		                <li class="nav-item"><a class="nav-link" href="index.jsp">Liste Articles</a></li>
		                <li class="nav-item ms-5"><a class="nav-link" href="addArticle.jsp">Ajouter Article</a></li>
		                <li class="nav-item ms-5"><a class="nav-link" href="searchArticle.jsp">Chercher Article</a></li>
		            
		            </ul>
	          	</div>
	      	</div>
	  	</nav>
	</header>
	<div class="container">
		<div class="ms-3">
			<h1 class="mt-3 mb-5 ">Afficher Détails Article</h1>
		</div>
		<!-- Contenu de la page Ajouter Article -->
			
		<div class="container mb-5">						
			<div class="row mb-2">
				<div class="col-2 fw-semibold"></div>
				<div class="col-10 fs-2 fw-semibold"><%=article.getTitle() %></div>
			</div>
			<div class="row mb-5">
				<div class="col-2"></div>
				<div class="col-8" style="background: url(<%=article.getImage() %>) center no-repeat; height : 550px; background-size:cover;"></div>
				<div class="col-2"></div>
			</div>
			<div class="row mt-3">
				<div class="col-2 fw-semibold"></div>
				<div class="col-5 fw-semibold">Catégorie: <%=article.getCategory() %></div>
				<div class="col-3 fw-semibold text-end">Créé en: <%=dateFormat.format(article.getCreateDate()) %></div>
			</div>
			<div class="row mb-4 mt-1">
				<div class="col-7 fw-semibold"></div>
				<div class="col-3 fw-semibold text-end">Modifié en: <%=dateFormat.format(article.getUpdateDate()) %></div>				
			</div>
			<div class="row mb-5">
				<div class="col-2 fw-semibold"></div>
				<div class="col-10"><%=article.getDescription() %></div>
			</div>
			<div class="row">
				<div class="col-6"></div>
				<div class="col-4 text-end">
					<a class="col-2" href="javascript:confirmDelete('deleteArticle?id=<%= article.getId()%>')">
						<button class="btn btn-danger btn-small">Supprimer</button>
					</a>
					
				</div>
			</div>				
		</div>
		
		<div class="container my-5">
			<!-- Afficher liste des commentaire pour cet article -->
			<div class="row ms-5">
				<% List<Commentaire> commentaires = article.getCommenataires();
				Collections.reverse(commentaires);
				if(commentaires.size() != 0){%>
					<div class="row">
						<h4 class="col-7 mt-4 mb3 text-primary fw-bold">Liste des commantaires :</h4>
						<div class="col-5 mt-4 mb3 text-end">Total des commentaires : <%=article.getCommenataires().size() %></div>
					</div>
					<hr class="border border-dark-subtle border-2 opacity-75 mx-5 mt-5">
					<%for (Commentaire comment : commentaires){ %>
					
						<h4 class="text-start mt-2 mb-4">
							<span class="fs-6 ms-5 p-1">Date : <%=dateFormat.format(comment.getCreatDate()) %></span>
						</h4>
						<p class="ms-5 fs-5"><%=comment.getComment() %></p>
						<p class="text-end">Rédigé par: <span class=" fst-italic fw-bold"><%=comment.getName() %></span></p>
						<hr/>
					<%}
				}%>
			</div>
		</div>
		<hr class="border border-dark-subtle border-2 opacity-75 mx-5 mt-5">
		<div class="container my-5">
			<form action="addComment" method="post">
				<div class="row mb-2">
					<div class="col-2">
						<input type="text" name="article_id" id="article_id" value="<%=article.getId() %>" class="d-none">
					</div>
					<div class="col-1 fw-semibold">Nom</div>
					<div class="col-4">
						<input class="form-control" type="text" id="name" name="name" required="required">
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-2"></div>
					<div class="col-1 fw-semibold">Commentaire</div>
					<div class="col-6">
						<textarea name="comment" class="form-control mb-2 w-100" aria-label="With textarea" rows="5"></textarea>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-4"></div>
					<div class="col-4">
						<button type="reset" class="btn btn-secondary btn-block fw-bold ps-5 pe-5 me-2">Annuler</button>
						<button type="submit" class="btn btn-success">Ajouter Commentaire</button>
					</div>
					<div class="col-4"></div>
				</div>
			</form>
		</div>
		<div class="row ms-3 pb-5">	
				<a class="mb-5" href="index.jsp">Retour à la liste des articles</a>
		</div>
		
	</div>
	
	<!-- Footer-->		
	<footer class="py-3 bg-dark fixed-bottom">
	    <div class="container px-1 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Mon Blog Bijoux 2023</p></div>
	</footer>
</body>
<script>

function confirmDelete(delUrl) {
  if (confirm("Etes-vous sure de vouloir supprimer cet article?")) {
   document.location = delUrl;
  }
}
</script>
</html>  

