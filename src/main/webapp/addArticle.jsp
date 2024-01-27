<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="url('https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js')"></script>
<title>Ajouter Article</title>
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
		                <li class="nav-item ms-5"><a class="nav-link active" aria-current="page" href="addArticle.jsp">Ajouter Article</a></li>
		                <li class="nav-item ms-5"><a class="nav-link" href="searchArticle.jsp">Chercher Article</a></li>
		            </ul>
	          	</div>
	      	</div>
	  	</nav>
	</header>
	<div class="container">
		<div class="ms-3">
			<h1 class="mt-3 mb-5 ">Ajouter un Nouveau article</h1>
		</div>
		<!-- Contenu de la page Ajouter Article -->
			
		<form action="addArticle" method="post">
			<div class="container">								
				<div class="row mb-2">
					<div class="col-2 fw-semibold">Titre</div>
					<div class="col-6">
						<input class="form-control" type="text" id="title" name="title" required="required">
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-2 fw-semibold">Catégorie</div>
					<div class="col-4">
						<select class="form-select" name="category" id="category" required="required" aria-label="Default select example">
							<option value = "" selected>Choisir une Catégorie</option>
							<option value="Bracelets">Bracelets</option>
							<option value="Colliers">Colliers</option>
							<option value="Bagues">Bagues</option>
							<option value="Boucles">Boucles</option>
						</select>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-2 fw-semibold">Description</div>
					<div class="col-8">
						<textarea name="description" class="form-control mb-2 w-100" aria-label="With textarea" rows="5"></textarea>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-2 fw-semibold">Image</div>
					<div class="col-6">
						<input class="form-control" type="text" id="image" name="image" required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-2"></div>
					<div class="col-8 text-end">
						<button type="reset" class="btn btn-secondary btn-block fw-bold ps-5 pe-5 me-2">Annuler</button>
						<button type="submit" class="btn btn-primary btn-block fw-bold ps-5 pe-5">Ajouter</button>
					</div>
				</div>				
			</div>
		</form>
		<div class="ms-3">
			<a href="index.jsp">Retour à la liste des articles</a>
		</div>
	</div>
	<!-- Footer-->		
	<footer class="py-3 bg-dark fixed-bottom">
	    <div class="container px-1 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Mon Blog Bijoux 2023</p></div>
	</footer>
</body>
</html>  

