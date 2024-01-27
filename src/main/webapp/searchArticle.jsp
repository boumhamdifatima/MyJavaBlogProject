<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="blog.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="blog.ArticleDAO" %>

<%
	ArticleDAO articleDAO = (ArticleDAO) application.getAttribute("articleDAO");
	
	List<Article> articles;
	String categoryRecherche = (String) request.getAttribute("category");
	if (categoryRecherche == null || categoryRecherche.isEmpty()){
		//pas de categorie spécifiée on affiches tous les articles
		articles = articleDAO.getArticles();
		categoryRecherche = "";
	}else {
		//On affiche les articles de la categorie spécifiée
		articles = (List<Article>) request.getAttribute("articles");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="styles.css" rel="stylesheet" />
<title>Rechercher Article</title>
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
		            	<li class="nav-item ms-5"><a class="nav-link active" aria-current="page" href="searchArticle.jsp">Chercher Article</a></li>
		            </ul>
	          	</div>
	      	</div>
	  	</nav>
	</header>
	<div class="container">
		<div class="d-flex align-items-start mb-5">
			<div class="pt-2 m-2 w-100">				
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0"></div>
						<form action="searchArticle" method="get">
							<div class="row mb-5">
								<div class="col-2"></div>
								<div class="col-1 fw-semibold">Catégorie</div>
								<div class="col-4">
									<input class="form-control" type="text" id="category" name="category" required="required">
								</div>
								<div class="col-1 text-end">
									<button type="submit" class="btn btn-success btn-block fw-bold ps-5 pe-5">Rechercher</button>
								</div>
								<div class="col-2"></div>
							</div>
						</form>
					<div class="tab-pane fade show active" id="v-pills-disabled" role="tabpanel" aria-labelledby="v-pills-disabled-tab" tabindex="0">
						<h3 class="mb-4 fw-bold">Liste des articles recherchés</h3>
						<p class="mb-4 fw-bold">Catégorie sélectionnée : <%=categoryRecherche %></p>
						<div class="container">
						<% if(articles.size() == 0){ %>
							<div class="text-danger">Aucun article trouvé !</div>
						<% }else{%>
							<ul class="list-group list-group-flush ms-5">
								<li class="list-group-item">
									<div class="row">
										<div class="col-2 fw-bold text-primary">Image</div>
										<div class="col-3 fw-bold text-primary">Titre</div>
										<div class="col-3 fw-bold text-primary">Catégorie</div>
									</div>
								</li>							
								<% for (Article article : articles){ %>
								<li class="list-group-item">
									<div class="row">
										<div class="col-2" style="background: url(<%=article.getImage() %>) center no-repeat; height : 80px; background-size:cover;"></div>
										<div class="col-3 mt-4"><%=article.getTitle() %></div>
										<div class="col-3 mt-4"><%=article.getCategory() %></div>
										<div class="col-1 mt-4"><a class="btn btn-primary" href="article?id=<%= article.getId()%>">Détail</a></div>
										<a class="col-1 mt-4" href="javascript:confirmDelete('deleteArticle?id=<%= article.getId()%>')">
											<button class="btn btn-danger btn-small">Supprimer</button>
										</a>
									</div>
								</li>
								<%}%>
							</ul>	
						<% }%>
						</div>
					</div>
					<div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" tabindex="0">...3</div>
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">...4</div>
				</div>				
			</div>
		</div>
	</div>
	<!-- Footer-->		
	<footer class="py-3 bg-dark fixed-bottom">
	    <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Mon Blog Bijoux 2023</p></div>
	</footer>
</body>
<!-- Bootstrap core JS-->
<script src="url('https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js')"></script>
<script>
function confirmDelete(delUrl) {
	  if (confirm("Etes-vous sure de vouloir supprimer cet article?")) {
	   document.location = delUrl;
	  }
	}
</script>
</html>  
