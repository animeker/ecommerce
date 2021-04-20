<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ViewCart.aspx.vb" Inherits="CIS_4250_Online_Store.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


   <asp:Button ID="btnEmptyCart" runat="server" Text="Empty the Cart" />
       
   
    <div id="content" class="site-content">
        <div id="primary" class="content-area width-normal">
        <main id="main" class="site-main">
            <div class="cont maincont">
                <h1 class="maincont-ttl">Cart</h1>
                <ul class="b-crumbs">
                    <li><a href="index.html">Home</a></li>
                    <li>Cart</li>
                </ul>
<asp:ListView ID="lvCart" runat="server" 
OnItemCommand="lvCart_OnItemCommand" CellPadding="3" DataKeyField="CartNo"
CellSpacing="0" RepeatColumns="1" DataKeyNames="ID">
<LayoutTemplate>
                <div style="float: left;">
                     <asp:Label ID="lblPage" runat="server" Text="" Font-Size="14px"></asp:Label>
              </div><br />
                <div class="page-styling">

                <div class="woocommerce prod-litems section-list">
                    <asp:PlaceHolder runat="server" id="itemPlaceholder"></asp:PlaceHolder>
                </div>
</LayoutTemplate>
<ItemTemplate>
    <article class="prod-li sectls">
                        <div class="prod-li-inner">
                            <a href="product.html" class="prod-li-img">
                                <img src="http://placehold.it/290x258" alt="">
                            </a>
                            <div class="prod-li-cont">
                                <div class="prod-li-ttl-wrap">
                                    <p>
                                        <a href="category.aspx">Heels</a>
                                    </p>
                                    <h3><a href="product.html"><%# Trim(Eval("ProductName")) %></a></h3>
                                    <asp:Label runat="server" ID="ProName" Visible="false" Text='<%# Eval("ProductName")%>'></asp:Label>
                                    <asp:Label runat="server" ID="ProNo" Visible="false" Text='<%# Eval("ProductNo")%>'></asp:Label>
                                    <asp:Label runat="server" ID="ProPrice" Visible="false" Text='<%# Eval("Price")%>'></asp:Label>
                                
                                </div><!--
                No Space
                --><div class="prod-li-prices row ">
                                <div class="prod-li-price-wrap col-md-3">
                                    <p>Price</p>
                                    <p class="prod-li-price"><%# Trim(Eval("Price")) %></p>
                                </div>
                                <div class="col-md-3">

                                        <asp:TextBox width="50px" TextMode="Number" ID="tbQuantity" Text='<%# Eval("Quantity")%>'  runat="server"></asp:TextBox>
                                  
                                         <asp:LinkButton runat="server" ID="lbUpdate" Text='Update'
                        CommandName="cmdUpdate" class="button hover-label prod-addbtn" CommandArgument='<%# Eval("Id")%>' />
                                   
                                </div>
                                <div class="prod-li-total-wrap col-md-3">
                                    <p>Total</p>
                                    <%


                                     %>
                                    <p class="prod-li-total">$<%# Eval("Price")%></p>
                                </div>
                            </div><!--
        No Space
    --></div>
                            <div class="prod-li-info">
                                <div class="prod-li-rating-wrap">
                                    <p data-rating="5" class="prod-li-rating">
                                        <i class="rating-ico" title="1"></i><i class="rating-ico" title="2"></i><i class="rating-ico" title="3"></i><i class="rating-ico" title="4"></i><i class="rating-ico" title="5"></i>
                                    </p>
                                    <p class="prod-li-rating-count">12</p>
                                </div>
                                <p class="prod-li-add">
                                    <asp:LinkButton runat="server" ID="lbDelete" class="button hover-label prod-addbtn" Text='Delete'
                        CommandName="cmdDelete" CommandArgument='<%# Eval("Id")%>' />
                                    <!-- <a href="#" class="button hover-label prod-addbtn"><i class="icon ion-close-round"></i><span>Remove</span></a> -->
                                </p>
                                <p class="prod-li-compare">
                                    <a href="compare.html" class="hover-label prod-li-compare-btn"><span>Compare</span><i class="icon ion-arrow-swap"></i></a>
                                </p>
                                <p class="prod-quickview">
                                    <a href="#" class="hover-label quick-view"><i class="icon ion-plus"></i><span>Quick View</span></a>
                                </p>
                                <div class="prod-li-favorites">
                                    <a href="wishlist.html" class="hover-label add_to_wishlist"><i class="icon ion-heart"></i><span>Add to Wishlist</span></a>
                                </div>
                                <p class="prod-li-information">
                                    <a href="#" class="hover-label"><i class="icon ion-more"></i><span>Show Information</span></a>
                                </p>
                            </div>
                        </div>

                    </article>
</ItemTemplate>
</asp:ListView>
<div style="padding: 8px;width: 100%;text-align: center;">
<div style="display: inline-block; margin-top: 5px">
<asp:Button runat="server" Text="&laquo;" id="show_prev" CssClass="show_prevx"></asp:Button>
<asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCart" PageSize="3">
<Fields>        
<asp:NumericPagerField NextPageText='&raquo;' PreviousPageText='&laquo;' ButtonCount="5" 
ButtonType="Button" NextPreviousButtonCssClass="next_prevx" NumericButtonCssClass="numericx" 
CurrentPageLabelCssClass="currentx" RenderNonBreakingSpacesBetweenControls="False" />
</Fields>
</asp:DataPager>
<asp:Button runat="server" Text="&raquo;" id="show_next" CssClass="show_nextx"></asp:Button>
</div>
</div> 
                <div class="cart-actions">
                    <div class="coupon">
                        <input type="text" placeholder="Coupon code">
                        <input type="submit" class="button" value="Apply">
                    </div>
                    <div class="cart-collaterals">
                        <a href="#" class="checkout-button button">Proceed to checkout</a>
                        <div class="order-total">
                            <p class="cart-totals-ttl">Total</p>
                            <p class="cart-totals-val">$510.00</p>
                        </div>
                    </div>
                </div>


            </div>
        </main><!-- #main -->
            </div>

    </div><!-- #primary -->   
            
</asp:Content>

