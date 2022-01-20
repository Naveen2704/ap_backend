<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Modify Package</h4>
                </div>
                <div class="card-body">
                    <form action="<?=base_url('Packages/editPackage')?>" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="package_id" value="<?=$packageInfo->package_id?>">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label for="">Title</label>
                                    <input type="text" name="title" value="<?=$packageInfo->package_name?>" placeholder="Package Name" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <select name="status" class="form-control" id="" required >
                                        <option value="1" <?=($packageInfo->status == 1)?'selected':''?>>Active</option>
                                        <option value="0" <?=($packageInfo->status == 0)?'selected':''?>>Inactive</option>
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
                                                $inv = explode(",", $packageInfo->investigations);
                                                if(in_array($value->investigation_id, $inv)){
                                                    $sel = "selected";
                                                }
                                                else{
                                                    $sel = '';
                                                }
                                                ?>
                                                <option value="<?=$value->investigation_id?>" <?=$sel?>><?=$value->investigation_name?></option>
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
                                    <input type="text" name="price" value="<?=$packageInfo->price?>" placeholder="Package Price" onkeypress="return numeric()" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Discount</label>
                                    <input type="text" name="discount" value="<?=$packageInfo->discount?>" placeholder="Discount" onkeypress="return numeric()" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Discount Unit</label>
                                    <!-- <input type="text" name="price" placeholder="Investigation Price" class="form-control"> -->
                                    <div class="mt-1">
                                        <div class="icheck-primary d-inline">
                                            <input type="radio" id="radioPrimary1" name="discount_unit" value="%" <?=($packageInfo->discount_unit == "%")?'checked':''?> required >
                                            <label for="radioPrimary1">%</label>
                                        </div>&nbsp;&nbsp;
                                        <div class="icheck-primary d-inline">
                                            <input type="radio" id="radioPrimary2" name="discount_unit" value="rs" <?=($packageInfo->discount_unit == "rs")?'checked':''?> required >
                                            <label for="radioPrimary2">Rs</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Description</label>
                                    <textarea name="description" rows="4" placeholder="Description" class="form-control" required ><?=$packageInfo->description?></textarea>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Image</label>
                                    <p><input type="file" name="file" ></p>
                                    <p><img src="<?=base_url('uploads/packages/'. $packageInfo->image)?>" height="100" width="100" alt=""></p>
                                </div>                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button class="btn bg-success" name="edit">Submit</button>
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