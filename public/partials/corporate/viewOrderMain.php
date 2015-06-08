<section class="container-fluid row clearfix">
    <div id='content' class='clearfix col-xs-12
      col-sm-offset-2 col-md-offset-2 col-lg-offset-2
      col-sm-8 col-md-8 col-lg-8'>
        <div id='successHolder' class="alert alert-success" role="alert" style='display:none;'>
            <div id='successContent'></div>
        </div>
        <div id='errorHolder' class="alert alert-danger" role="alert" style='display:none;'>
            <div id='errorContent'></div>
        </div>
        <div id='corporateInformation'>
            <h2>Order page.</h2>
            <p>Verify the information for this order.
            </p>
        </div>

        <section id='corporateBody'>
            <?=$corporateOrders;?>
        </section>
    </div><!-- End content -->
</section>
