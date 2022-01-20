
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h3 class="mb-2 ml-2 mt-0"> Dashboard</h3>
        </div>
    </div>
    <div class="row col-12">
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
            <div class="inner">
                <h3><?=$packagesCount?></h3>
                <p>Packages</p>
            </div>
            <div class="icon">
                <i class="fa fa-box"></i>
            </div>
            <a href="<?=base_url('Packages')?>" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
            <div class="inner">
                <h3><?=$invCount?></h3>

                <p>Investigations</p>
            </div>
            <div class="icon">
                <i class="fa fa-vial"></i>
            </div>
            <a href="<?=base_url('Investigations')?>" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
            <div class="inner">
                <h3><?=$ordersCount?></h3>

                <p>Orders</p>
            </div>
            <div class="icon">
                <i class="fa fa-tasks"></i>
            </div>
            <a href="<?=base_url('Orders')?>" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
            <div class="inner">
                <h3><?=$custCount?></h3>

                <p>Customers</p>
            </div>
            <div class="icon">
                <i class="fa fa-users"></i>
            </div>
            <a href="<?=base_url('Users')?>" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
    </div>
    <!-- </div> -->
    
</div>