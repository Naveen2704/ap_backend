<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Create Package</h4>
                </div>
                <div class="card-body">
                    <form action="<?=base_url('Packages/addPackage')?>" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label for="">Title</label>
                                    <input type="text" name="title" placeholder="Package Name" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <select name="status" class="form-control" id="" required >
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Investigations</label>
                                    <select name="investigations[]" multiple class="form-control" id="investigations" required >
                                        <?php
                                        if(count($investigations) > 0){
                                            foreach($investigations as $value){
                                                ?>
                                                <<option value="<?=$value->investigation_id?>"><?=$value->investigation_name?></option>
                                                <?php
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Price</label>
                                    <input type="text" name="price" placeholder="Package Price" onkeypress="return numeric()" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Discount</label>
                                    <input type="text" name="discount" placeholder="Discount" onkeypress="return numeric()" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Discount Unit</label>
                                    <!-- <input type="text" name="price" placeholder="Investigation Price" class="form-control"> -->
                                    <div class="mt-1">
                                        <div class="icheck-primary d-inline">
                                            <input type="radio" id="radioPrimary1" name="discount_unit" value="%" required >
                                            <label for="radioPrimary1">%</label>
                                        </div>&nbsp;&nbsp;
                                        <div class="icheck-primary d-inline">
                                            <input type="radio" id="radioPrimary2" name="discount_unit" value="rs" required >
                                            <label for="radioPrimary2">Rs</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Description</label>
                                    <textarea name="description" rows="4" placeholder="Description" class="form-control" required ></textarea>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Image</label>
                                    <p><input type="file" name="file" ></p>
                                </div>                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button class="btn bg-success" name="add">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('#investigations').select2();
    })
</script>