<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="blog.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="blog.ArticleDAO" %>

<%
	ArticleDAO articleDAO = (ArticleDAO) application.getAttribute("articleDAO");

	List<Article> allArticles = articleDAO.getArticles();
	String categoryToShow = request.getParameter("category");
	
	HashMap<String, List<Article>> articlesByCategory = new HashMap<>();

	// Parcourez la liste des articles
	for (Article article : allArticles) {
	    String category = article.getCategory();

	    // Vérifiez si la catégorie existe déjà dans la HashMap
	    if (articlesByCategory.containsKey(category)) {
	        // Si la catégorie existe, ajoutez l'article à la liste existante
	        articlesByCategory.get(category).add(article);
	    } else {
	        // Si la catégorie n'existe pas, créez une nouvelle liste et ajoutez l'article
	        List<Article> categoryList = new ArrayList<>();
	        categoryList.add(article);
	        articlesByCategory.put(category, categoryList);
	    }
	}
	
	List<Article> articles = new ArrayList<>();

	if (categoryToShow == null || categoryToShow.isEmpty()) {
	    // Affichez tous les articles
	    categoryToShow = "";
	    articles = allArticles;
	} else {
	    // Filtrer les articles par catégorie
	    if (articlesByCategory.containsKey(categoryToShow)) {
	        articles = articlesByCategory.get(categoryToShow);
	    }
	}


	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="styles.css" rel="stylesheet" />
<title>Mon Blog Bijoux</title>
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
		                <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Liste Articles</a></li>
		                <li class="nav-item ms-5"><a class="nav-link" href="addArticle.jsp">Ajouter Article</a></li>
		            	<li class="nav-item ms-5"><a class="nav-link" href="searchArticle.jsp">Rechercher Article</a></li>
		            </ul>
	          	</div>
	      	</div>
	  	</nav>
	</header>
	<div class="container">
		<div class="d-flex align-items-start mb-5">
			<div class="sidebar mt-5 mb-5">
				<div class="nav flex-column nav-pills me-3 w-100 mt-5" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<button class="btn-hover border border-primary nav-link mb-2 fw-bold <%= (categoryToShow == null || categoryToShow.equals("")) ? "active" : "" %>" id="v-pills-home-tab">Toutes les catégories(<%=allArticles.size() %>)</button>
					<button class="btn-hover border border-primary nav-link mb-2 fw-bold <%= (categoryToShow.equals("Bracelets")) ? "active" : "" %>" id="v-pills-disabled-tab">Les Bracelets(<%=(articlesByCategory.get("Bracelets") != null) ? articlesByCategory.get("Bracelets").size() : 0 %>)</button>
					<button class="btn-hover border border-primary nav-link mb-2 fw-bold <%= (categoryToShow.equals("Colliers")) ? "active" : "" %>" id="v-pills-messages-tab">Les Colliers(<%=(articlesByCategory.get("Colliers") != null) ? articlesByCategory.get("Colliers").size() : 0 %>)</button>
					<button class="btn-hover border border-primary nav-link mb-2 fw-bold <%= (categoryToShow.equals("Bagues")) ? "active" : "" %>" id="v-pills-profile-tab">Les Bagues(<%=(articlesByCategory.get("Bagues") != null) ? articlesByCategory.get("Bagues").size() : 0 %>)</button>
					<button class="btn-hover border border-primary nav-link mb-2 fw-bold <%= (categoryToShow.equals("Boucles")) ? "active" : "" %>" id="v-pills-settings-tab">Les boucles d'oreilles(<%=(articlesByCategory.get("Boucles") != null) ? articlesByCategory.get("Boucles").size() : 0 %>)</button>
				</div>
			</div>
			<div class="pt-2 m-2 w-100">				
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0"></div>
					<div class="tab-pane fade show active" id="v-pills-disabled" role="tabpanel" aria-labelledby="v-pills-disabled-tab" tabindex="0">
						<h3 class="mb-4 fw-bold">La liste des articles </h3>
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
document.addEventListener("DOMContentLoaded", function() {
	
    document.getElementById("v-pills-home-tab").addEventListener("click", function() {
        window.location.href = "index.jsp"; // Redirection vers la même page sans paramètre de catégorie
    });

    document.getElementById("v-pills-disabled-tab").addEventListener("click", function() {
        window.location.href = "index.jsp?category=Bracelets";
    });

    document.getElementById("v-pills-messages-tab").addEventListener("click", function() {
    	window.location.href = "index.jsp?category=Colliers";
    });

    document.getElementById("v-pills-profile-tab").addEventListener("click", function() {
        window.location.href = "index.jsp?category=Bagues";
    });

    document.getElementById("v-pills-settings-tab").addEventListener("click", function() {
        window.location.href = "index.jsp?category=Boucles";
    });
});

function confirmDelete(delUrl) {
	  if (confirm("Etes-vous sure de vouloir supprimer cet article?")) {
	   document.location = delUrl;
	  }
	}
</script>

</html>  
