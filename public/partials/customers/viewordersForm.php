<section class="container-fluid row">
    <div id='content' class='clearfix col-xs-12
      col-sm-offset-3 col-md-offset-3 col-lg-offset-3
      col-sm-6 col-md-6 col-lg-6'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'></div>
        </div>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <div id='customerInformation'>
            <h2>Welcome to your Widget Corp. Customer Orders page.</h2>
            <?=$customerInformation;?>
            <p>You can remove any orders that you no longer want and check the status of orders.  Please note that
            you cannot delete an order which has already been fulfilled.</p>
            <p>If this information is inaccurate, go to the <a href="customerEdit.php">Customer Edit Page</a> and change it.

            </p>
        <button type="button" class="btn btn-info" id='createNewOrder' aria-label="Left Align">
          <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
          <span id='textForOrder'>Make new order</span>
        </button>
        </div>
        <div id='showOrder' style='display:none;margin-bottom:2rem;'>
            <form id='addNewOrder' name='addNewOrder' method='POST' action='../../jsHelper/reroute.php' novalidate>
                <input type='hidden' id='csrf' name='csrf' value='<?=$_SESSION['csrf_token'];?>' />
                <input type='hidden' id='to' name='to' value='Controllers/Customers/AddNewOrderController.php' />
                <div class="form-group">
                <label for="newOrder" class="col-sm-2 control-label">New Order:</label>
                <div class='col-sm-10'>
                    <input type="number" name='newOrder' id="newOrder" class="form-control"
                    placeholder="Number to Order" min='0' required="" autocomplete="off"
                    data-original=""
                    value=''>
                    </div>
                </div>
                <button type='submit' class='btn btn-default' id='submitNewOrder'>
                    Add Order
                </button>
            </form>
        </div>
        <header id='columnDefinitions'><div class='col-sm-3 definitionHeader'>Order id</div>
           <div class='col-sm-3 definitionHeader'>Fulfilled</div>
           <div class='col-sm-3 definitionHeader'>Unfulfilled</div>
           <div class='col-sm-3 definitionHeader'>Delete Order</div>
       </header>
       <section id='customerBody'>
       <form id='removeOrders' name='removeOrders'
       method='POST' action='../../jsHelper/reroute.php' novalidate>
       <input type='hidden' name='to' value='Controllers/Customers/RemoveOrderController.php' />
            <?=$customerOrders;?>
        </form>
        </section>

    </div><!-- End content -->

</section>
