<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Modify Investigation</h4>
                </div>
                <div class="card-body">
                    <form action="<?=base_url('Investigations/editInv')?>" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="investigation_id" value="<?=$invInfo->investigation_id?>">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label for="">Title</label>
                                    <input type="text" name="title" value="<?=$invInfo->investigation_name?>" placeholder="Investigation Title" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <select name="status" class="form-control" id="" required >
                                        <option value="1" <?=($invInfo->status == 1)?'selected':''?>>Active</option>
                                        <option value="0" <?=($invInfo->status == 0)?'selected':''?>>Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Category</label>
                                    <select name="category" class="form-control" id="" required >
                                        <option selected disabled>Select Category</option>
                                        <?php
                                        if(count($categories) > 0){
                                            foreach($categories as $value){
                                                ?>
                                                <<option value="<?=$value->category_id?>" <?=($value->category_id == $invInfo->category)?'selected':''?>><?=$value->category_name?></option>
                                                <?php
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Price</label>
                                    <input type="text" name="price" value="<?=$invInfo->price?>" placeholder="Investigation Price" onkeypress="return numeric()" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Discount</label>
                                    <input type="text" name="discount" value="<?=$invInfo->discount?>" placeholder="Discount" onkeypress="return numeric()" class="form-control" required >
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Discount Unit</label>
                                    <!-- <input type="text" name="price" placeholder="Investigation Price" class="form-control"> -->
                                    <div class="mt-1">
                                        <div class="icheck-primary d-inline">
                                            <input type="radio" id="radioPrimary1" name="discount_unit" value="%" <?=($invInfo->discount_unit == "%")?'checked':''?> required >
                                            <label for="radioPrimary1">%</label>
                                        </div>&nbsp;&nbsp;
                                        <div class="icheck-primary d-inline">
                                            <input type="radio" id="radioPrimary2" name="discount_unit" value="rs" <?=($invInfo->discount_unit == "rs")?'checked':''?> required >
                                            <label for="radioPrimary2">Rs</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Short Names / Keywords</label>
                                    <textarea name="short_names" rows="4" placeholder="Short Names / Keywords" class="form-control" required ><?=$invInfo->short_keywords?></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Description</label>
                                    <textarea name="description" rows="4" placeholder="Description" class="form-control" required ><?=$invInfo->description?></textarea>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Image</label>
                                    <p><input type="file" name="file" ></p>
                                    <p><img src="<?=base_url('uploads/investigations/'. $invInfo->image)?>" height="100" width="100" alt=""></p>
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