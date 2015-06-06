<section class="container-fluid row">
    <div id='content' class='clearfix col-xs-12
      col-sm-offset-2 col-md-offset-2 col-lg-offset-2
      col-sm-8 col-md-8 col-lg-8'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'></div>
        </div>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <div id='customerInformation'>
            <h2>Welcome to your Widget Corp. Corporate Orders page.</h2>
            <p>If you are an admin, you can remove any orders that are fulfilled and you can edit
            an order. </p>

            <?=$orderButton;?>
        </div>
        <div id='showOrder' style='display:none;margin-bottom:2rem;'>
            <form id='addNewOrder' name='addNewOrder' method='post' action='#' novalidate>
                <input type='hidden' id='csrf' value='<?=$_SESSION['csrf_token'];?>' />
                <div class="form-group clearfix">
                    <label for="newOrder" class="col-sm-2 control-label">New Order:</label>
                    <div class='col-sm-10'>
                        <input type="number" name='newOrder' id="newOrder" class="form-control"
                        placeholder="Number to Order" min='0' required="" autocomplete="off"
                        data-original=""
                        value=''>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label for="customerOrder" class="col-sm-2 control-label">Customer:</label>
                    <div class='col-sm-10'>
                    <select class='form-control' id='customerList'>
                        <?=$customerList;?>
                    </select>

                    </div>
                </div>
                <?=$addNewOrderButton;?>
            </form>
        </div>
        <header id='columnDefinitions'>
            <div class='col-sm-3 definitionHeader'>Order id</div>
            <div class='col-sm-3 definitionHeader'>Number Fulfilled</div>
            <div class='col-sm-3 definitionHeader'>Number Unfulfilled</div>
            <div class='col-sm-3 definitionHeader'>Delete Order</div>
        </header>
        <section id='customerBody'>
            <?=$corporateOrders;?>
        </section>
    </div><!-- End content -->
</section>
