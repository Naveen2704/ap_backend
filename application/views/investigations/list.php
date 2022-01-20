<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title w-100">Investigations List
                        <a href="<?=base_url('Investigations/add')?>" class="btn btn-xs bg-blue float-right">Add Investigation</a>
                    </h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Investigation Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if(count($investigations) > 0){
                                    $i = 1;
                                    foreach($investigations as $value){
                                        $catInfo = getCategoryInfo($value->category);
                                        ?>
                                        <tr>
                                            <td><?=$i?></td>
                                            <td><?=$value->investigation_name?></td>
                                            <td><?=$catInfo->category_name?></td>
                                            <td><?=$value->price?></td>
                                            <td><span class="badge <?=($value->status == 0)?'badge-danger':'badge-success'?>"><?=($value->status == 0)?'Inactive':'Active'?></span></td>
                                            <td>
                                                <a href="<?=base_url('Investigations/edit/'.$value->investigation_id)?>" class="btn btn-xs bg-blue">Edit</a>
                                                <a href="<?=base_url('Investigations/delete/'.$value->investigation_id)?>" class="btn btn-xs btn-danger" onclick="return confirm('Are you sure to delete?')">Delete</a>
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