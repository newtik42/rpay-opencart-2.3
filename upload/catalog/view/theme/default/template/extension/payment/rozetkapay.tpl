<?php if($pay){ ?>
<form method="GET" id="rozetkapay" action="<?=$pay_href;?>" accept-charset="utf-8">
    <?php if($pay_qrcode){ ?>
    <img rpay_qrcode src="" style="display: none" height="150">    
    <input type="submit" value="<?=$button_confirm;?>"/>
    <?php }else{ ?>
    <input type="submit" value="<?=$button_confirm;?>" id="button-confirm" class="btn btn-primary button" />
    <?php } ?>
</form>
<script>
    <?php if($pay_qrcode){ ?>
    $.ajax({
        method:'POST',
        url: 'index.php?route=<?=$path;?>/genQrCode',
        data:{ 'text':'<?=$pay_href;?>' }
    }).done(function (image) {
        $('[rpay_qrcode]').attr('src',image).show()
        $('svg[rpay]').hide()
    })    
    <?php } ?>
</script>
<?php }else{ ?>
<div rozetkapay_alert_error style="color: red"><?=$error;?></div>
<?php } ?>