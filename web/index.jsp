 <script>
            $(document).ready(function ()
            {
                //If u want to change Interval of corousal
                $('.carousel').carousel({
                    interval: 3000
                });
            });  
        </script>
<%@include file="public_header.jsp" %>

<!-- banner-bottom -->
<div id="myCarousel" class="carousel slide" data-ride="carousel" >
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "system");
                        Statement stmt32 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs32 = stmt32.executeQuery("select * from banner");

                        int pos1 = 0;

                        while (rs32.next()) {

                            String applyclass;

                            if (pos1 == 0) {
                                applyclass = "data-slide-to=\"0\" class=\"active\"";
                            } else {
                                applyclass = "data-slide-to=\"" + pos1 + "\"";
                            }

                            pos1++;
                    %>
                    <li data-target="#myCarousel" <%= applyclass%>></li>
                    <%
                        }
                    %>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <%
                        Statement stmt33 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs33 = stmt33.executeQuery("select * from banner");
                        int pos2 = 0;
                        while (rs33.next()) {
                            String photo = rs33.getString("photo");
                            String c_name = rs33.getString("c_name");
                            String subc_name = rs33.getString("subc_name");
                            String min_price = rs33.getString("min_price");
                            String max_price = rs33.getString("max_price");
                            String dis = rs33.getString("dis");
                            String applyclass;
                            if (pos2 == 0) {
                                applyclass = "class=\"item active\"";
                            } else {
                                applyclass = "class=\"item\"";
                            }
                            pos2++;
                    %>
                    <div <%= applyclass%> >
                        <a href="show_sub_products.jsp?subc_name=<%=subc_name%>&c_name=<%=c_name%>&max_price=<%=max_price%>&min_price=<%=min_price%>&dis=<%=dis%>>"><img src="<%=photo%>" alt="<%=c_name%>" /></a>
                    </div>
                    <%
                        }
                    %>
                </div>
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

<!-- //banner-bottom -->
<!-- footer-top -->
	<div class="footer-top animated wow zoomInDown" data-wow-duration="1000ms" data-wow-delay="800ms">
		<div class="container">
			<h3>For Door delivery call- to- us <span>+917986833547</span></h3>
			<p>Request a free estimate from our <span>toll free</span> number</p>
			<div class="more">
				<a href="mail.jsp">Contact Us</a>
			</div>
			
		</div>
	</div>
<!-- //footer-top -->
<!-- footer -->
	<div class="footer-copy animated wow bounceInDown" data-wow-duration="1000ms" data-wow-delay="800ms">
		<div class="container">
			<div class="footer-copy-grids">
				<div class="col-md-3 footer-copy-grid">
					<h3>About <span>Us</span></h3>
                                        <img src="images/about_us.jpg" alt=" " class="img-responsive" />
					<p>We deliver a wide range of gifts, flowers and cakes available online.</p>
				</div>
				<div class="col-md-3 footer-copy-grid">
					<h3>Give<span> FEEDBACK</span></h3>
					<form>
						<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
						<input type="email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
						<textarea type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
						<input type="submit" value="Submit" >
					</form>
				</div>
				<div class="col-md-3 footer-copy-grid">
					<h3>Popular <span>Items</span></h3>
					<div class="footer-copy-grids">
						<div class="col-xs-4 footer-copy-grid1">
                                                    <a href="all_products.jsp"><img src="images/black_forest.jpg" alt=" " class="img-responsive" /></a>
						</div>
						<div class="col-xs-4 footer-copy-grid1">
                                                    <a href="all_products.jsp"><img src="images/cup2.jpg" alt=" " class="img-responsive" /></a>
						</div>
						<div class="col-xs-4 footer-copy-grid1">
                                                    <a href="all_products.jsp"><img src="images/gifts_cat_pic.jpg" alt=" " class="img-responsive" /></a>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="footer-copy-grids">
						<div class="col-xs-4 footer-copy-grid1">
                                                    <a href="all_products.jsp"><img src="images/j_cat.jpg" alt=" " class="img-responsive" /></a>
						</div>
						<div class="col-xs-4 footer-copy-grid1">
                                                    <a href="all_products.jsp"><img src="images/combo_cat_pic1.jpg" alt=" " class="img-responsive" /></a>
						</div>
						<div class="col-xs-4 footer-copy-grid1">
                                                    <a href="all_products.jsp"><img src="images/fnt.jpg" alt=" " class="img-responsive" /></a>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="col-md-3 footer-copy-grid">
					<h3>Navigation</h3>
					<ul>
						<li><a href="#">Mail Us</a></li>
						<li><a href="#">About Us</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>

<%@include file="footer.html" %>