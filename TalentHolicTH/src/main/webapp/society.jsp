<%@page import="com.google.appengine.api.images.ImagesServiceFactory"%>
<%@page import="com.google.appengine.api.images.ServingUrlOptions"%>
<%@page import="com.google.appengine.api.images.ImagesService"%>
<%@page import="com.google.appengine.api.blobstore.BlobKey"%>
<%@page import="osa.entity.LikeEntity"%>
<%@page import="osa.entity.CommentEntity"%>
<%@page import="osa.entity.UserDetailsEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="osa.entity.PostEntity"%>
<%@page import="java.util.List"%>
<%@page import="osa.entity.SocietyDetailsEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%UserDetailsEntity user=(UserDetailsEntity)session.getAttribute("userdetails");
SocietyDetailsEntity soc=(SocietyDetailsEntity)session.getAttribute("societydetails");%>
<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<%SocietyDetailsEntity sde=(SocietyDetailsEntity)session.getAttribute("societydetails"); %>
<html dir='ltr' lang='en-US'>
<head>

	<meta http-equiv='content-type' content='text/html; charset=utf-8' />
	<meta name='author' content='SemiColonWeb' />

	<!-- Stylesheets
	============================================= -->
	<link href='https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i' rel='stylesheet' type='text/css' />
	<link rel='stylesheet' href='css/bootstrap.css' type='text/css' />
	<link rel='stylesheet' href='style.css' type='text/css' />
	<link rel='stylesheet' href='css/dark.css' type='text/css' />
	<link rel='stylesheet' href='css/font-icons.css' type='text/css' />
	<link rel='stylesheet' href='css/animate.css' type='text/css' />
	<link rel='stylesheet' href='css/magnific-popup.css' type='text/css' />

	<link rel='stylesheet' href='css/responsive.css' type='text/css' />
	<meta name='viewport' content='width=device-width, initial-scale=1' />

	<!-- Document Title
	============================================= -->
	<title><%=sde.name %></title>

	<style>
.header-login-trigger {
	float: right;
	width: 20px;
	height: 20px;
	line-height: 20px;
	font-size: 20px;
	text-align: center;
	margin: 40px 0 40px 10px;
	color: #222;
	-webkit-transition: margin .4s ease;
	-o-transition: margin .4s ease;
	transition: margin .4s ease;
}

.header-login-trigger:hover { color: #666; }

#header.sticky-header .header-login-trigger { margin: 20px 0 20px 10px; }
</style>


</head>

<body class='stretched'>

	<!-- Document Wrapper
	============================================= -->
	<div id='wrapper' class='clearfix'>

		<!-- Header
		============================================= -->
		<header id='header' class='full-header dark'>

			<div id='header-wrap'>

				<div class='container clearfix'>

					<div id='primary-menu-trigger'><i class='icon-reorder'></i></div>

					<!-- Logo
					============================================= -->
					<div id="logo">
						<a href="main.jsp" class="standard-logo" data-dark-logo="images/talentholic.png"><img src="images/talentholic.png" alt="Canvas Logo"></a>
						<a href="main.jsp" class="retina-logo" data-dark-logo="images/talentholic@2x.png"><img src="images/talentholic2x.png" alt="Canvas Logo"></a>
					</div><!-- #logo end -->

					<%if((session.getAttribute("userdetails")!=null)||(session.getAttribute("societydetails")!=null)) {%>

					<div id="top-account" class="dropdown">
						<%
						
					if((user!=null)&&(user.imagekey!=null)){

					BlobKey bk=new BlobKey(user.imagekey);
					ImagesService imagesService = ImagesServiceFactory.getImagesService();

					ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
 
  
					String servingUrl = imagesService.getServingUrl(servingOptions); %>
					
						<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="<%=servingUrl %>" height="30" width="30"></a>
					<%}
					
					else if((soc!=null)&&(soc.profilekey!=null)){
						BlobKey bk=new BlobKey(soc.profilekey);
						ImagesService imagesService = ImagesServiceFactory.getImagesService();

						ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
	 
	  
						String servingUrl = imagesService.getServingUrl(servingOptions); %>
						
							<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="<%=servingUrl %>" height="30" width="30"></a>
					
					<%} 
					else{%><a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="images/icons/avatar.jpg" height="30" width="30"></a><%} %>
<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
							<%if(session.getAttribute("societydetails")!=null){ %>
							<a class="dropdown-item tleft" href="society.jsp">
							<%}else{ %><a class="dropdown-item tleft" href="profile.jsp"><%} %>
							Profile</a>
							<a class="dropdown-item tleft" href="newpost.jsp">New Post</a>
							<%if(session.getAttribute("societydetails")!=null){ %>
							<a class="dropdown-item tleft" href="newevent.jsp">New Event</a><%} %>
							<% if(session.getAttribute("societydetails")!=null){ %><a class="dropdown-item tleft" href="societysettings.jsp"><%}else{ %><a class="dropdown-item tleft" href="settings.jsp"><%} %>Settings</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item tleft" href="/logout">Logout <i class="icon-signout"></i></a>
						</ul>
					</div>
					<%} %>


					<!-- Primary Navigation
					============================================= -->
					<nav id="primary-menu">

						<ul>
							<li><a href="main.jsp"><div>Home</div></a></li>
							<li><a href="#"><div>Categories</div></a>
								<ul>
									<li><a href="dance.jsp"><div>Dance</div></a></li>
									<li><a href="drama.jsp"><div>Drama</div></a></li>
									<li><a href="music.jsp"><div>Music</div></a></li>
									<li><a href="literary.jsp"><div>Literary</div></a></li>
									<li><a href="humanitarian.jsp"><div>Humanitarian</div></a></li>
									<li><a href="photography.jsp"><div>Photography</div></a></li>
									<li><a href="creativity.jsp"><div>Creativity</div></a></li>
									<li><a href="technical.jsp"><div>Technical</div></a></li>
								</ul>
							</li>
							<li><a href="events.jsp"><div>Events</div></a></li>
							<li><a href="aboutus.jsp"><div>About Us</div></a></li>
							<%if((session.getAttribute("userdetails")==null)&&(session.getAttribute("societydetails")==null)) {%>
							<li><a href="login.jsp"><div>Login</div></a></li>
							<%} %>
							
						</ul>

												
						
					
					<!-- Top Search
						============================================= -->
						<!-- <div id='top-search'>
							<a href='#' id='top-search-trigger'><i class='icon-search3'></i><i class='icon-line-cross'></i></a>
							<form action='search.html' method='get'>
								<input type='text' name='q' class='form-control' value='' placeholder='Type &amp; Hit Enter..'>
							</form>
						</div> --><!-- #top-search end -->
					
					</nav><!-- #primary-menu end -->

				</div>

			</div>

		</header><!-- #header end -->

		<!-- Page Title
		============================================= -->
		<%if(sde.coverkey==null)
		{%><section id="page-title" class="page-title-parallax page-title-dark" style="padding: 250px 0; background-image: url('images/about/parallax.jpg'); background-size: cover; background-position: center center;" data-bottom-top="background-position:0px 400px;" data-top-bottom="background-position:0px -500px;">
		<%}else{ 
			BlobKey bk=new BlobKey(soc.coverkey);
			ImagesService imagesService = ImagesServiceFactory.getImagesService();
			 
			ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
			 
			  
			String servingUrl = imagesService.getServingUrl(servingOptions);
		%>	<section id="page-title" class="page-title-parallax page-title-dark" style="padding: 250px 0; background-image: url('<%=servingUrl %>'); background-size: cover; background-position: center center;" data-bottom-top="background-position:0px 400px;" data-top-bottom="background-position:0px -500px;">
		<%} %>
			<div class='container clearfix center'>
				<h1><%=sde.name %></h1>
				<span>Society Head : <a href'#'><%=sde.head %></a>
					<br>
					Number : <%=sde.phone %>
				</span>
			<p><h4 style='color:#FFF; text-shadow:  10 -4px 20px rgba(0, 0, 0, .25);'><%=sde.bio %></h4></p>
			</div>
			
			

		</section><!-- #page-title end -->

		<!-- Content
		============================================= -->
		<section id='content'>

			<div class='content-wrap'>

				

				<div class='container clearfix center'>
				
					<!-- Sidebar
					============================================= -->
					<div class='sidebar nobottommargin clearfix'>
						<div class='sidebar-widgets-wrap'>

							<div class='widget widget-twitter-feed clearfix'>

								
							</div>

							<div class='widget clearfix'>

								
							</div>



						</div>

					</div><!-- .sidebar end -->
					

					<div class='postcontent nobottommargin clearfix bothsidebar' >

						<div id='posts' >

							<%
							
									List<PostEntity> li=(List<PostEntity>)application.getAttribute("postlist");
									if(li!=null){
									Iterator<PostEntity> itr = li.iterator();
									
									while(itr.hasNext())
									{
										PostEntity pe = itr.next();
										
										if(pe.name.equals(soc.name)){
										%>
										
							<div class="entry clearfix`center" style="padding: 10px;border: 1px solid #dcd8d8; box-sizing: border-box;">
								<div>
									<bold><a href="#"><%=pe.name %></a></bold>
								</div>
								<%if(pe.type.equals("video")) {%>
								<div class="entry-image center" style="position : reference">
									<%if(pe.embed!=null){%><%=pe.embed%><%} %>
								</div>
								<%} 
								if(pe.type!=null){
									if(pe.type.equals("image")){
										if(pe.imgkey!=null){
									BlobKey bk=new BlobKey(pe.imgkey);
									ImagesService imagesService = ImagesServiceFactory.getImagesService();
									 
									ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
									 
									  
									String servingUrl = imagesService.getServingUrl(servingOptions);
									
									
									%>
									
									<div class="entry-image center" style="position : reference">
										<img src="<%=servingUrl%>">
									</div>
									<%}}} %>
							
								<div class="entry-content center">
									<p><%=pe.description %></p>
								</div>
								<%
								List<LikeEntity> ll=(List<LikeEntity>)application.getAttribute("likelist");
								Iterator<LikeEntity> itl=ll.iterator();
								while(itl.hasNext())
								{
									LikeEntity le=itl.next();
									String sid=Long.toString(pe.id);
									if(le.id.equals(sid)){
								%>
								
								<div class="entry-title center"><% if((user!=null)||soc!=null){%>
									<a href="like?id=<%=pe.id%>&url=society.jsp"><i class="icon-arrow-up icons"></i><%=le.like %></a>&nbsp;/&nbsp;<a href="dislike?id=<%=pe.id%>&url=society.jsp"><i class="icon-arrow-down icons"></i><%=le.dislike %></a>&nbsp;/&nbsp;<%} %><a href="#"><i class="icon-folder-open"></i><%=pe.category %></a>&nbsp;/&nbsp;<a href="blog-single-full.html#comments"><i class="icon-comments"></i>Comment</a>&nbsp;/&nbsp;<a href="delete?id=<%=pe.id%>&url=society.jsp"><i class="icon-close icons"></i>Delete</a>
								</div>
								<%} }%>
								<%if((user!=null)||soc!=null){ %>
								<div class="comments" align="left">
									<h7>Comments</h7>
																	
									<%
									List<CommentEntity> lc=(List<CommentEntity>)application.getAttribute("commentlist");
									Iterator<CommentEntity> it=lc.iterator();
									
									while(it.hasNext())
									{
										CommentEntity ce=it.next();
										String pid=Long.toString(pe.id);
										if(ce.postId.equals(pid)) 
										{%>
									
									 <div style="padding: 10px;border: 1px solid #dcd8d8; box-sizing: border-box;">
									<bold ><a href="#" align="left"><%=ce.name %></a></bold>
									<br><%=ce.comment %>
								</div> 
								 <%}}%>
									
									
									
									<div>
										<form id="comment" action="comment?id=<%=pe.id %>&name=<%if(user!=null){ %><%=user.name %><%}else if(soc!=null){ %><%=soc.name %><%}else{ %><%="Anonymous" %><%} %>&url=society.jsp" role="form" method="post" class="nobottommargin">
											<div class="col_full">
												<label for="comment">Comment<small>*</small></label>
												<textarea class="sm-form-control" id="comment" name="comment" rows="2" cols="30"></textarea>
											</div>
											<div class="col_full">
												<button style="height:25px; font-size:10px; line-height:20px"class="button button-3d nomargin" type="submit" id="comment-submit" name="comment-submit" value="submit">Submit</button>
											</div>
										</form>
									</div>
								</div><%} %>
							</div>
							
										
										
										
										
										<% }}
									}
							
							
							
							
							%>


				</div>

			</div>

		</section><!-- #content end -->

					<!-- Footer
		============================================= -->
		<footer id="footer" class="dark">

			<!-- Copyrights
			============================================= -->
			<div id="copyrights">

				<div class="container clearfix">					

					<div class="col_half">
						<div class="copyrights-menu copyright-links clearfix">
							<a href="main.jsp">Home</a>/<a href="events.jsp">Events</a>/<a href="aboutus.jsp">About Us</a>/<a href="contact.jsp">Contact Us</a>/<a href="faq.jsp">FAQs</a>
						</div>
						Copyrights &copy; 2018 All Rights Reserved by TalentHolic.
					</div>               

					<div class="col_half col_last tright">
						<div class="fright clearfix">
							<a href="https://www.facebook.com/talentholic.th.9" class="social-icon si-small si-borderless si-facebook">
								<i class="icon-facebook"></i>
								<i class="icon-facebook"></i>
							</a>

							<a href="https://twitter.com/ThHolic" class="social-icon si-small si-borderless si-twitter">
								<i class="icon-twitter"></i>
								<i class="icon-twitter"></i>
							</a>

							<a href="https://plus.google.com/discover" class="social-icon si-small si-borderless si-gplus">
								<i class="icon-gplus"></i>
								<i class="icon-gplus"></i>
							</a>
							
							<a href="https://in.pinterest.com/" class="social-icon si-small si-borderless si-pinterest">
								<i class="icon-pinterest"></i>
								<i class="icon-pinterest"></i>
							</a>


						</div>

						<div class="clear"></div>
                         <i class="icon-envelope2"></i>talentholicth@gmail.com <span class="middot">&middot;</span> <i class="icon-headphones"></i> +91-8130508403 
						<span class="middot">&middot;</span> <i class="icon-headphones"></i> +91-7982106539<div><i class="icon-headphones"></i> +91-9971227534 </div>
						</div>
				</div>
			</div><!-- #copyrights end -->

		</footer><!-- #footer end -->		
	

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id='gotoTop' class='icon-angle-up'></div>

	<!-- External JavaScripts
	============================================= -->
	<script src='js/jquery.js'></script>
	<script src='js/plugins.js'></script>

	<!-- Footer Scripts
	============================================= -->
	<script src='js/functions.js'></script>

	<script>
		jQuery( '#tabs-profile' ).on( 'tabsactivate', function( event, ui ) {
			jQuery( '.flexslider .slide' ).resize();
		});
	</script>

</body>
</html>