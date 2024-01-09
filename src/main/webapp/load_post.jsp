<%@page import="com.pahadians.entities.User"%>
<%@page import="com.pahadians.dao.LikeDao"%>
<%@page import="com.pahadians.entities.Post"%>
<%@page import="java.util.List"%>
<%@ page import="com.pahadians.dao.PostDao"%>
<%@ page import="com.pahadians.helper.ConnectionProvider"%>

<div class="row">
	<%
	User user = (User)session.getAttribute("currentUser");
	
	/* This thread.sleep() is used to show loader that's all 
	   since the project is running of a local machine but if
	   it is running on some server then don't use it coz it will
	   create extra loading time.
	*/
	Thread.sleep(1000);
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if(cid == 0){
		posts = dao.getAllPosts();
	}else{
		posts = dao.getPostByCid(cid);
		
	}
	
	if(posts.size()==0){
	out.println(
			"<h5 class='display-4 text-center'>No Post, U CAN\'T SEE ME</h5>"
			);
	}
	
	for (Post post : posts) {
	%>
		<div class="col-md-6 mt-2">
			<div class="card">
				<img class="card-img-top" src="blog_pics/<%= post.getpPic() %>" alt="Card image cap">
				<div class="card-body">
					<strong><%= post.getpTitle() %></strong>
					<p><%= post.getpContent() %></p>
				</div>
				<div class="card-footer primary-background text-center">
					
					<%
						LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
					%>
					
					<a href="#" onclick="doLike(<%=post.getPid()%>, <%= user.getId()%>)" class="btn btn-sm btn-outline-light">
					<i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(post.getPid()) %></span>
					</a>
					
					<a href="show_blog_page.jsp?post_id=<%= post.getPid() %>" class="btn btn-sm btn-outline-light">Read More...</a>
					
					<a href="#" class="btn btn-sm btn-outline-light">
					<i class="fa fa-commenting-o"></i><span>20</span>
					</a>
					
				</div>
			</div>		
		</div>
	<%
	}
	%>
</div>