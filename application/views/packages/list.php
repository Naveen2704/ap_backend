<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title w-100">Packages List
                        <a href="<?=base_url('Packages/add')?>" class="btn btn-xs bg-purple float-right">Create Package</a>
                    </h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Package Name</th>
                                    <th>Investigations List</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if(count($packages) > 0){
                                    $i = 1;
                                    foreach($packages as $value){
                                        ?>
                                        <tr>
                                            <td><?=$i?></td>
                                            <td><?=$value->package_name?></td>
                                            <td><?=getInvNames($value->investigations)?></td>
                                            <td><?=$value->price?></td>
                                            <td><span class="badge <?=($value->status == 0)?'badge-danger':'badge-success'?>"><?=($value->status == 0)?'Inactive':'Active'?></span></td>
                                            <td>
                                                <a href="<?=base_url('Packages/edit/'.$value->package_id)?>" class="btn btn-xs bg-blue">Edit</a>
                                                <a href="<?=base_url('Packages/delete/'.$value->package_id)?>" onclick="return confirm('Are you sure to delete?')" class="btn btn-xs bg-danger">Delete</a>
                                            </td>
                                        </tr>
                                        <?php
                                        $i++;
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>