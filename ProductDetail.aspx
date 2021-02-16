<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ProductDetail.aspx.vb" Inherits="CIS_4250_Online_Store.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="content" class="site-content">
        <div id="primary" class="content-area">
            <main id="main" class="site-main">
                <div class="cont maincont">
                    <ul class="b-crumbs">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="catalog-gallery.html">Catalog</a></li>
                        <li>Product</li>
                    </ul>            <article>
                    <div class="prod">
                        <div class="prod-slider-wrap prod-slider-shown">
                            <div class="flexslider prod-slider" id="prod-slider">
                                <ul class="slides">
                                    <li>
                                        <a data-fancybox-group="prod" class="fancy-img" href="http://placehold.it/810x722">
                                            
                                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Productimg") %>' />
                                        </a>
                                    </li>
                                    
                                </ul>
                                <div class="prod-slider-count"><p><span class="count-cur">1</span> / <span class="count-all">2</span></p><p class="hover-label prod-slider-zoom"><i class="icon ion-search"></i><span>Zoom In</span></p></div>
                            </div>
                            <div class="flexslider prod-thumbs" id="prod-thumbs">
                                <ul class="slides">
                            
                            
                                
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
                           <!-- <p class="prod-categs"><a href="#">Lighting</a>, <a href="#">Tools</a></p> -->
                            <h1><asp:Label ID="lblProductName" runat="server" Text=""></asp:Label></h1>
                            <div class="variations_form cart">
                                <p class="prod-price"><asp:Label ID="lblUnitPrice" runat="server" Text=""></asp:Label></p>
                                <p class="prod-excerpt"> <asp:Label ID="lblProductDescription2" runat="server" Text=""></asp:Label> <a id="prod-showdesc" class="prod-excerpt-more" href="#">read more</a></p>
                                <div class="prod-add">
                                    <div class="variations">
                                        <div class="variations-row">
                                            <div class="label"><label >Сolor</label></div>
                                            <div class="value">
                                                <select>
                                                    <option value="">Choose an option</option>
                                                    <option value="blue">Blue</option>
                                                    <option value="green">Green</option>
                                                    <option value="yellow">Yellow</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnAddtoCart" class="icon ion-android-cart" runat="server" Text="Add to cart" />
                                   <!-- <button type="submit" class="button"><i class="icon ion-android-cart"></i> Add to cart</button> -->
                                    
                                    <p class="qnt-wrap prod-li-qnt">
                                        <asp:TextBox ID="tbQuantity" runat="server"></asp:TextBox>
                                       <!-- <asp:TextBox ID="tQuantity" runat="server"></asp:TextBox> -->
                                        <!-- <a href="#" class="qnt-plus prod-li-plus"><i class="icon ion-arrow-up-b"></i></a>
                                        <input type="text" value="1">
                                        <a href="#" class="qnt-minus prod-li-minus"><i class="icon ion-arrow-down-b"></i></a> -->
                                    </p>
                                    <div class="prod-li-favorites">
                                        <a href="wishlist.html" class="hover-label add_to_wishlist"><i class="icon ion-heart"></i><span>Add to Wishlist</span></a>
                                    </div>
                                    <p class="prod-li-compare">
                                        <a href="compare.html" class="hover-label prod-li-compare-btn"><span>Compare</span><i class="icon ion-arrow-swap"></i></a>
                                    </p>
                                </div>
                            </div>
                            <div class="prod-props">
                                <dl class="product_meta">
                                    <dt>Product No:</dt>
                                    <dd><asp:Label ID="lblProductNo" runat="server" Text=""></asp:Label></dd>
                                    <!-- <dt>Brand:</dt>
                                    <dd><a href="#">BMP</a></dd>
                                    <dt>Weight</dt>
                                    <dd>1 kg</dd>
                                    <dt>Dimensions</dt>
                                    <dd>4 x 50 cm</dd>
                                    <dt>Сolor</dt>
                                    <dd>Blue, Green</dd>
                                    <dt>Manufacturer</dt>
                                    <dd>Germany</dd>
                                    <dt>Material</dt>
                                    <dd>Metal, Plastic</dd> -->
                                </dl>
                            </div>
                        </div>
                        <p class="prod-badge">
                            <span class="badge-1">TOP SELLER</span>
                        </p>
                    </div>
                    <div class="prod-tabs-wrap">
                        <ul class="prod-tabs">
                            <li id="prod-desc" class="active" data-prodtab-num="1">
                                <a data-prodtab="#prod-tab-1" href="#">Description</a>
                            </li>
                            <li data-prodtab-num="2" id="prod-props">
                                <a data-prodtab="#prod-tab-2" href="#">Additional information</a>
                            </li>
                            <li data-prodtab-num="3" id="prod-reviews">
                                <a data-prodtab="#prod-tab-3" href="#">Reviews (7)</a>
                            </li>
                            <li class="prod-tabs-addreview">Add a review</li>	</ul>
                        <div class="prod-tab-cont">
                            <p data-prodtab-num="1" class="prod-tab-mob active" data-prodtab="#prod-tab-1">Description</p>
                            <div class="prod-tab page-styling prod-tab-desc" id="prod-tab-1">
                                <p><asp:Label ID="lblProductDescription" runat="server" Text=""></asp:Label></p>
                            </div>
                            <p data-prodtab-num="2" class="prod-tab-mob" data-prodtab="#prod-tab-2">Additional information</p>
                            <div class="prod-tab" id="prod-tab-2">
                                <dl class="prod-tab-props">
                                    <dt>Weight</dt>
                                    <dd>1 kg</dd>
                                    <dt>Dimensions</dt>
                                    <dd>4 x 50 cm</dd>
                                    <dt>Сolor</dt>
                                    <dd><p><a href="#">Blue</a>, <a href="#">Green</a></p></dd>
                                    <dt>Manufacturer</dt>
                                    <dd><p><a href="#">Germany</a></p></dd>
                                    <dt>Material</dt>
                                    <dd><p><a href="#">Metall</a>, <a href="#">Plastic</a></p></dd>
                                </dl>
                            </div>
                            <p data-prodtab-num="3" class="prod-tab-mob" data-prodtab="#prod-tab-3">Reviews (7)</p>
                            <div class="prod-tab prod-reviews" id="prod-tab-3">
                                <div id="reviews">
                                    <div id="review_form_wrapper" class="prod-addreview-form">
                                        <div id="review_form">
                                            <div id="respond" class="comment-respond">
                                                <p class="prod-tab-addreview" id="reply-title">Add a Review</p>
                                                <form action="#" method="post" id="commentform" class="comment-form">
                                                    <div class="comment-form-rating">
                                                        <p class="stars"><span><a class="star-1" href="#">1</a><a class="star-2" href="#">2</a><a class="star-3" href="#">3</a><a class="star-4" href="#">4</a><a class="star-5" href="#">5</a></span></p>
                                                        <select>
                                                            <option value="">Rate…</option>
                                                            <option value="5">Perfect</option>
                                                            <option value="4">Good</option>
                                                            <option value="3">Average</option>
                                                            <option value="2">Not that bad</option>
                                                            <option value="1">Very Poor</option>
                                                        </select>
                                                    </div>
                                                    <textarea placeholder="Review"></textarea>
                                                    <input type="submit" class="submit" value="Add a Review">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <ul id="comments">
                                        <li class="prod-review">
                                            <div>
                                                <h3>admin</h3>
                                                <p class="prod-review-rating" title="Rated 5 out of 5">
                                                    <i class="rating-ico"></i>
                                                    <i class="rating-ico"></i>
                                                    <i class="rating-ico"></i>
                                                    <i class="rating-ico"></i>
                                                    <i class="rating-ico"></i>
                                                    <time datetime="2017-05-09T14:16:55+00:00">May 9, 2017</time>
                                                </p>
                                                <p>Aliquam ligula quam, vehicula non porta at, venenatis ac purus. Pellentesque pharetra, turpis sit amet elementum faucibus, tellus nisi condimentum metus, nec scelerisque tortor velit ac purus. Aenean interdum velit quis nisi rhoncus ullamcorper. Cras lorem metus, imperdiet vel tortor vitae, malesuada pellentesque felis. Nulla varius mi a varius semper. Sed tristique ligula tincidunt pellentesque rhoncus. Praesent purus urna, imperdiet in pellentesque sed, hendrerit quis mauris. Maecenas consequat ultrices augue ac tempor. Etiam semper eu ligula id iaculis. Morbi scelerisque neque at velit porta, et fringilla nisl pulvinar. Duis at rhoncus est, nec cursus orci. Nunc malesuada tellus magna, in feugiat mauris placerat eu. Nullam elementum est id aliquam imperdiet.</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h2 class="prod-related-ttl">You may also like…</h2>
                    <div class="row prod-items prod-items-4">
                        <article class="cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3 sectgl-item sectgl-item">
                            <div class="sectgl prod-i">
                                <div class="prod-i-top">
                                    <a class="prod-i-img" href="product.html">
                                        <img src="http://placehold.it/290x258" alt="">
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
                                        <p class="prod-i-price">$120.00</p>
                                        <p class="prod-i-categ"><a href="catalog-gallery.html">Lighting</a></p>
                                    </div>
                                    <h3 class="prod-i-ttl"><a href="product.html">Searchlight Portable</a></h3>
                                </div>
                            </div>
                        </article>                                            <article class="cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3 sectgl-item sectgl-item">
                        <div class="sectgl prod-i">
                            <div class="prod-i-top">
                                <a class="prod-i-img" href="product.html">
                                    <img src="http://placehold.it/290x258" alt="">
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
                                    <p class="prod-i-price"><del>$15.00</del> $20.00</p>
                                    <p class="prod-i-categ"><a href="catalog-gallery.html">Other</a></p>
                                </div>
                                <h3 class="prod-i-ttl"><a href="product.html">Flooring</a></h3>
                            </div>
                        </div>
                    </article>                                            <article class="cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3 sectgl-item sectgl-item">
                        <div class="sectgl prod-i">
                            <div class="prod-i-top">
                                <a class="prod-i-img" href="product.html">
                                    <img src="http://placehold.it/290x195" alt="">
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
                                    <p class="prod-i-price">$18.00</p>
                                    <p class="prod-i-categ"><a href="catalog-gallery.html">Other</a></p>
                                </div>
                                <h3 class="prod-i-ttl"><a href="product.html">Pneumatic Coil Hose</a></h3>
                            </div>
                        </div>
                    </article>                                            <article class="cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3 sectgl-item sectgl-item">
                        <div class="sectgl prod-i">
                            <div class="prod-i-top">
                                <a class="prod-i-img" href="product.html">
                                    <img src="http://placehold.it/290x258" alt="">
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
                                    <p class="prod-i-price">$45.00</p>
                                    <p class="prod-i-categ"><a href="catalog-gallery.html">Other</a></p>
                                </div>
                                <h3 class="prod-i-ttl"><a href="product.html">Door Hinge Metal</a></h3>
                            </div>
                        </div>
                    </article>                                    </div>

                    <h2 class="prod-related-ttl">Related Products</h2>
                    <div class="row prod-items prod-items-4">
                        <article class="cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3 sectgl-item sectgl-item">
                            <div class="sectgl prod-i">
                                <div class="prod-i-top">
                                    <a class="prod-i-img" href="product.html">
                                        <img src="http://placehold.it/290x258" alt="">
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
                                    <p class="prod-i-badge"><span>Sale</span></p>
                                </div>
                                <div class="prod-i-bot">
                                    <div class="prod-i-info">
                                        <p class="prod-i-price">$70.00</p>
                                        <p class="prod-i-categ"><a href="catalog-gallery.html">Electricity</a></p>
                                    </div>
                                    <h3 class="prod-i-ttl"><a href="product.html">Universal Plug</a></h3>
                                </div>
                            </div>
                        </article>                                            <article class="cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3 sectgl-item sectgl-item">
                        <div class="sectgl prod-i">
                            <div class="prod-i-top">
                                <a class="prod-i-img" href="product.html">
                                    <img src="http://placehold.it/290x258" alt="">
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
                                    <p class="prod-i-price"><del>$12.00</del> $22.00</p>
                                    <p class="prod-i-categ"><a href="catalog-gallery.html">Tools</a></p>
                                </div>
                                <h3 class="prod-i-ttl"><a href="product.html">Drill Tool Kit</a></h3>
                            </div>
                        </div>
                    </article>                                            <article class="cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3 sectgl-item sectgl-item">
                        <div class="sectgl prod-i">
                            <div class="prod-i-top">
                                <a class="prod-i-img" href="product.html">
                                    <img src="http://placehold.it/290x258" alt="">
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
                                    <p class="prod-i-price">$24.00</p>
                                    <p class="prod-i-categ"><a href="catalog-gallery.html">Pipes</a></p>
                                </div>
                                <h3 class="prod-i-ttl"><a href="product.html">Metal-Plastic Pipes</a></h3>
                            </div>
                        </div>
                    </article>                                            <article class="cf-sm-6 cf-md-6 cf-lg-3 col-xs-6 col-sm-6 col-md-6 col-lg-3 sectgl-item sectgl-item">
                        <div class="sectgl prod-i">
                            <div class="prod-i-top">
                                <a class="prod-i-img" href="product.html">
                                    <img src="http://placehold.it/290x258" alt="">
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
                                    <p class="prod-i-price">$31.00</p>
                                    <p class="prod-i-categ"><a href="catalog-gallery.html">Electricity</a></p>
                                </div>
                                <h3 class="prod-i-ttl"><a href="product.html">LED Lamp</a></h3>
                            </div>
                        </div>
                    </article>                                    </div>

                </article>
                </div>
            </main><!-- #main -->
        </div><!-- #primary -->


        <!-- Elements -->
        <div class="content-area width-full">
            <div class="maincont page-styling page-full">

                <div class="container-fluid page-styling row-wrap-full product-special">
                    <div class="container">
                        <div class="getspec">
                            <div class="getspec-cont">
                                <h3>warranty</h3>
                                <p>for all goods</p>
                                <form action="#" method="post" class="wpcf7 wpcf7-form">
                                    <p class="wpcf7-form-control-wrap">
                                        <input size="40" type="text" placeholder="Name">
                                    </p>
                                    <p class="wpcf7-form-control-wrap">
                                        <input size="40" type="email" placeholder="E-mail address">
                                    </p>
                                    <p class="wpcf7-form-control-wrap">
                                        <input size="40" type="text" placeholder="Phone number">
                                    </p>
                                    <p>
                                        <input type="submit" value="Send">
                                    </p>
                                </form>
                            </div>
                            <a href="#" class="getspec-img">
                                <img src="http://placehold.it/640x324" alt="">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="container mb20 page-styling row-wrap-container row-wrap-nottl">
                    <div class="row">
                        <div class="cf-lg-4 col-sm-4">
                            <div class="iconbox-item iconbox-i-3">
                                <div class="iconbox-i-top">
                                    <p class="iconbox-i-img">
                                        <i class="fa fa-road"></i>
                                    </p>
                                    <h3>Financing Services</h3>
                                </div>
                                <p>Vestibulum eu odio vitae neque blandit consequat ut nec nisi. Maecenas et velit sem. Nam egestas lectus vel fringilla accumsan.</p>
                            </div>
                        </div>
                        <div class="cf-lg-4 col-sm-4">
                            <div class="iconbox-item iconbox-i-3">
                                <div class="iconbox-i-top">
                                    <p class="iconbox-i-img">
                                        <i class="fa fa-truck"></i>
                                    </p>
                                    <h3>Lead Qualification</h3>
                                </div>
                                <p>Aliquam fermentum tortor lacus, id dictum tellus feugiat non. Donec rutrum ligula sed dui lobortis, id scelerisque sem volutpat.</p>
                            </div>
                        </div>
                        <div class="cf-lg-4 col-sm-4">
                            <div class="iconbox-item iconbox-i-3">
                                <div class="iconbox-i-top">
                                    <p class="iconbox-i-img">
                                        <i class="fa fa-shield"></i>
                                    </p>
                                    <h3>Security Service</h3>
                                </div>
                                <p>Etiam iaculis urna metus, in volutpat dolor faucibus at. Nulla vitae aliquet justo. Aenean in iaculis sapien. Vivamus rutrum hendrerit egestas.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container mb60 page-styling row-wrap-container row-wrap-nottl">
                    <div class="promobox-i promobox-i-hasbtn">
                        <h3>Optio Quis Inventore</h3>
                        <p>Nam dictum condimentum eros, eu tincidunt ex hendrerit sed. Fusce eleifend rutrum magna vel scelerisque. Donec purus sapien, tincidunt a congue quis, hendrerit quis massa.</p>
                        <a class="promobox-i-link" href="#">READ MORE</a>
                    </div>
                </div>
                <div class="container-fluid page-styling row-wrap-full product-parallax-bg" style="background-image: url(http://placehold.it/1920x1280);"></div>
            </div>
        </div>




    </div><!-- #content -->         

</asp:Content>
