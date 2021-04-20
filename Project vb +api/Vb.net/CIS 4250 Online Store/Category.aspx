<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Category.aspx.vb" Inherits="CIS_4250_Online_Store.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div id="page" class="site">


    
    <div id="content" class="site-content">
        <div id="primary" class="content-area">
            <main id="main" class="site-main">
                <div class="cont maincont">

                    <div class="section-top">

                        <h1 class="maincont-ttl">Shop</h1>
                        <ul class="b-crumbs">
                            <li><a href="index.html">Home</a></li>
                            <li>Catalog - Gallery</li>
                        </ul>
                        <div class="section-top-sort">
                            <div class="section-view">
                                <p>View</p>
                                <div class="dropdown-wrap">
                                    <p class="dropdown-title section-view-ttl">Gallery</p>
                                    <ul class="dropdown-list">
                                        <li>
                                            <a href="catalog-list.html">List</a>
                                        </li>
                                        <li class="active">
                                            <a href="catalog-gallery.html">Gallery</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="section-sort">
                                <p>Sort</p>
                                <div class="dropdown-wrap">
                                    <p class="dropdown-title section-sort-ttl">Newness</p>
                                    <ul class="dropdown-list">
                                        <li>
                                            <a href="#">Popularity</a>
                                        </li>
                                        <li>
                                            <a href="#">Average rating</a>
                                        </li>
                                        <li class="active">
                                            <a href="#">Newness</a>
                                        </li>
                                        <li>
                                            <a href="#">Price: low to high</a>
                                        </li>
                                        <li>
                                            <a href="#">Price: high to low</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                           <!-- <form method="post" class="products-per-page">
                                <p>Per Page</p>
                                <select>
                                    <option value="12" selected="selected">12</option>
                                    <option value="24">24</option>
                                    <option value="48">48</option>
                                    <option value="-1">All</option>
                                </select>
                            </form> -->
                        </div>
                    </div>

                    <!-- To make Sidebar "Not Sticky" just remove  id="section-list-withsb" -->
                    <div class="section-wrap-withsb">
                        <aside class="blog-sb-widgets section-sb" id="section-sb">
                            <div class="theiaStickySidebar">
                                <p class="section-filter-toggle filter_hidden">
                                    <a href="#" id="section-filter-toggle-btn">Show Filter</a>
                                </p>
                                <div class="section-filter">
                                    <div class="section-filter">
                                        <div class="blog-sb-widget multishopcategories_widget">
                                            <h3 class="widgettitle"><asp:Label ID="lblMainCategoryName" runat="server" Text=""></asp:Label></h3>
                                            <div class="section-sb-current">
                                                <ul class="section-sb-list">
                                                   <!-- <li>
                                                        <a href="#"><span class="section-sb-label">Electricity <span class="count">6</span></span></a>
                                                    </li> -->
                                           <asp:Repeater ID="rpSubCategory" runat="server" >
                                                    <ItemTemplate>
                                                       
                                                        <li><a href="Category.aspx?SubCategoryId=<%# Eval("ID")%>&SubCategoryName=<%# Trim(Eval("CategoryName")) %>&MainCategoryID=<% = Request.QueryString("MainCategoryID")%>&MainCategoryName=<% = Request.QueryString("MainCategoryName")%>"><%# Trim(Eval("CategoryName"))%>

                                                            </a>

                                                        </li> 
                                                        
                          
                                                            
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                                </ul>
                                            </div>
                                        </div>
                                        <div class="blog-sb-widget multishopfeaturedproducts_widget">
                                            <h3 class="widgettitle">
                                                <asp:Label ID="lblFeaturedProducts" runat="server" Text="Featured"></asp:Label></h3>
                                            <div class="products-featured-wrap">
                                                
                                                <div class="products-featured">
                                                    <p class="products-featured-categ">
                                                        <a href="#">Heels</a>
                                                    </p>
                                                    <h5 class="products-featured-ttl"><a href="product.html"><%# Trim(Eval("ProductName"))%></a></h5>
                                                    <p class="products-featured-price"><%# GetWholesalePrice(Trim(Eval("UnitPrice"))) %></p>
                                                </div>
                                             
                                                
                                        
                                            </div>
                                        </div>
                                        
                                        <div class="blog-sb-widget multishopbrands_widget">
                                            <h3 class="widgettitle">Brands</h3>
                                            <ul class="brands-list-sb">
                                                <li>
                                                    <a href="#">HOOK <span class="count">5</span></a>
                                                </li>
                                                <li>
                                                    <a href="#">Fuel Tank <span class="count">7</span></a>
                                                </li>
                                                <li>
                                                    <a href="#">BMP <span class="count">17</span></a>
                                                </li>
                                                <li>
                                                    <a href="#">BISON <span class="count">9</span></a>
                                                </li>
                                                <li>
                                                    <a href="#">AIR <span class="count">6</span></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside>        <div class="section-list-withsb" id="section-list-withsb">
                        <div class="theiaStickySidebar">

                            <!--
                            Gallery Item Columns:

                            With Sidebar:
                            prod-items-4 : cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3
                            prod-items-3 : cf-sm-6 cf-md-6 cf-lg-4 col-xs-6 col-sm-6 col-md-6 col-lg-4

                            Without Sidebar:
                            prod-items-4 : cf-sm-6 cf-md-4 cf-lg-3 col-xs-6 col-sm-6 col-md-4 col-lg-3
                            prod-items-3 : cf-sm-6 cf-md-4 cf-lg-4 col-xs-6 col-sm-6 col-md-4 col-lg-4

                            For Both:
                            prod-items-2 : cf-sm-6 cf-md-6 cf-lg-6 col-xs-6 col-sm-6 col-md-6 col-lg-6
                            prod-items-1 : col-lg-12
                            -->
                                <div style="text-align:center;margin-bottom:10px"><asp:Label runat="server" ID="lblpro" Font-Size="Larger"></asp:Label>
                            </div>
                            <div class="row prod-items prod-items-2">
                                                <asp:Repeater ID="rpProductList" runat="server" >
                                        <ItemTemplate>

                                <article class="cf-sm-6 cf-md-6 cf-lg-6 col-xs-6 col-sm-6 col-md-6 col-lg-6 sectgl-item">
                                    <div class="sectgl prod-i">
                                        <div class="prod-i-top">
                                            <a class="prod-i-img" href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>">
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Productimg") %>' />
                                                
                                            </a>
                                            <div class="prod-i-actions">
                                                <div class="prod-i-actions-in">
                                                    <div class="prod-li-favorites">
                                                        <a href="wishlist.html" class="hover-label add_to_wishlist"><i class="icon ion-heart"></i><span>Add to Wishlist</span></a>
                                                    </div>
                                                    <p class="prod-quickview">
                                                        <a href="#" class="hover-label quick-view"><i class="icon ion-plus"></i><span>Quick View</span></a>
                                                    </p>
                                                    <p class="prod-i-cart">
                                                        <a href="#" class="hover-label prod-addbtn"><i class="icon ion-android-cart"></i><span>Add to Cart</span></a>
                                                    </p>
                                                    <p class="prod-li-compare">
                                                        <a href="compare.html" class="hover-label prod-li-compare-btn"><span>Compare</span><i class="icon ion-arrow-swap"></i></a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="prod-i-bot">
                                            <div class="prod-i-info">
                                                <p class="prod-i-price"><%# GetWholesalePrice(Trim(Eval("UnitPrice"))) %></p>
                                                <p class="prod-i-categ"><%# Trim(Eval("ProductNo"))%></p>
                                            </div>
                                            <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>"><h3 class="prod-i-ttl"><%# Trim(Eval("ProductName"))%></h3></a>
                                        </div>
                                    </div>
                                </article>          
                                        </ItemTemplate>
                                               </asp:Repeater>
                                         
                            </div>
                            <ul class="page-numbers">
                                <li><span class="page-numbers current">1</span></li>
                                <li><a class="page-numbers" href="#">2</a></li>
                                <li><a class="page-numbers" href="#">3</a></li>
                                <li><a class="page-numbers" href="#">4</a></li>
                                <li><a class="next page-numbers" href="#"><i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </div><!-- .theiaStickySidebar -->
                    </div><!-- .section-list-withsb -->
                    </div><!-- .section-wrap-withsb -->

                </div>
            </main><!-- #main -->
        </div><!-- #primary -->

    </div><!-- #content -->

 
    <div class="form-validate modal-form" id="modal-form">
       <!-- <form action="#" method="POST" class="form-validate">
            <h4>Contact Us</h4>
            <input type="text" placeholder="Your name" data-required="text" name="name">
            <input type="text" placeholder="Your phone" data-required="text" name="phone">
            <input type="text" placeholder="Your email" data-required="text" data-required-email="email" name="email">
            <input class="btn1" type="submit" value="Send">
        </form> -->
    </div>

    <div class="cont maincont quick-view-modal">
        <article>
            <div class="prod">
                <div class="prod-slider-wrap prod-slider-shown">
                    <div class="flexslider prod-slider" id="prod-slider">
                        <ul class="slides">
                            <li>
                                <a data-fancybox-group="prod" class="fancy-img" href="http://placehold.it/1000x1000">
                                    <img src="http://placehold.it/550x550" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-fancybox-group="prod" class="fancy-img" href="http://placehold.it/1000x1000">
                                    <img src="http://placehold.it/550x550" alt="">
                                </a>
                            </li>
                            <li>
                                <a data-fancybox-group="prod" class="fancy-img" href="http://placehold.it/1000x1000">
                                    <img  src="http://placehold.it/550x550" alt="">
                                </a>
                            </li>
                        </ul>
                        <div class="prod-slider-count"><p><span class="count-cur">1</span> / <span class="count-all">3</span></p><p class="hover-label prod-slider-zoom"><i class="icon ion-search"></i><span>Zoom In</span></p></div>
                    </div>
                    <div class="flexslider prod-thumbs" id="prod-thumbs">
                        <ul class="slides">
                            <li>
                                <img src="http://placehold.it/550x550" alt="">
                            </li>
                            <li>
                                <img src="http://placehold.it/550x550" alt="">
                            </li>
                            <li>
                                <img src="http://placehold.it/550x550" alt="">
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="prod-cont">
                    <div class="prod-rating-wrap">
                        <p data-rating="4" class="prod-rating">
                            <i class="rating-ico" title="1"></i><i class="rating-ico" title="2"></i><i class="rating-ico" title="3"></i><i class="rating-ico" title="4"></i><i class="rating-ico" title="5"></i>
                        </p>
                        <p class="prod-rating-count">7</p>
                    </div>
                    <p class="prod-categs"><a href="#">Lighting</a>, <a href="#">Tools</a></p>
                    <h2>Belt Sanders</h2>
                    <p class="prod-price">$25.00</p>
                    <p class="stock in-stock">7 in stock</p>
                    <p class="prod-excerpt">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget...</p>
                    <div class="prod-add">
                        <button type="submit"
                                class="button"><i class="icon ion-android-cart"></i> Add to cart
                        </button>
                        <p class="qnt-wrap prod-li-qnt">
                            <a href="#" class="qnt-plus prod-li-plus"><i class="icon ion-arrow-up-b"></i></a>
                            <input type="text" value="1">
                            <a href="#" class="qnt-minus prod-li-minus"><i class="icon ion-arrow-down-b"></i></a>
                        </p>
                        <div class="prod-li-favorites">
                            <a href="wishlist.html" class="hover-label add_to_wishlist"><i class="icon ion-heart"></i><span>Add to Wishlist</span></a>
                        </div>
                        <p class="prod-li-compare">
                            <a href="compare.html" class="hover-label prod-li-compare-btn"><span>Compare</span><i class="icon ion-arrow-swap"></i></a>
                        </p>
                    </div>
                </div>
            </div>
        </article>
    </div>
</div><!-- #page -->
   

</asp:Content>
