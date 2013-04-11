//All project jqueries goes here
$(".remove_image").live("click", function(event){
    if(confirm("Are you sure?"))
        $(this).parent().submit();
});

$(".add-new-image").live("click", function(event){
    $(this).parent().submit();
});

$(".image-link").live("click", function(){
    $("#outer-image"+$(this).attr("image_id")).show();
    $(".outer-image").not($("#outer-image"+$(this).attr("image_id"))).hide();
});

$(".cb-enable").live("click",function(){
    $(".dvLoading").show();
    var clicked_object = $(this);
    var parent = $(this).parents('.switch');
    $.ajax({
        url: '/users/'+$(this).parent().attr("id")+'/status',
        type : "PUT",
        success: function(data) {
            $('.cb-disable',parent).removeClass('selected');
            $(clicked_object).addClass('selected');
            $(".dvLoading").hide();
        }
    });
});

$(".cb-disable").live("click",function(){
    $(".dvLoading").show();
    var clicked_object = $(this);
    var parent = $(this).parents('.switch');
    $.ajax({
        url: '/users/'+$(this).parent().attr("id")+'/status',
        type : "PUT",
        success: function(data) {
            $('.cb-enable',parent).removeClass('selected');
            $(clicked_object).addClass('selected');
            $(".dvLoading").hide();
        }
    });
});

$(".claim-type").live("click", function(){
    $("#claim_type").val($(this).attr("radio_type"));
    $(".product-form").submit();
});

$(".remove-selection").live("click", function(){    
    $("#claim_type").val("");
});

$(".master_claims_list").live("change", function(){
    $(".dvLoading").show();
    $.ajax({
        url: '/master_claims/'+$(this).val()+'/sub_claims',
        type : "GET",
        success: function(data) {
            $(".dvLoading").hide();
        }
    });
});

$(".status-list").live("change", function(){
  change_assignee_label();
});

$("#additional_claim_claim_type").live("change", function(){
    $(".dvLoading").show();
    $.ajax({
        url: '/products/'+ $("#product_val").val() +'/additional_claims/users',
        type : "GET",
        data : { claim_type : $(this).val()},
        success: function(data) {
            change_assignee_label();
            $(".dvLoading").hide();
        }
    });
});

function change_assignee_label()
{
    if($(".status-list").val() == "Unassigned")
    {
        $(".users_list").removeClass("required");
        $(".users_list").addClass("optional");
        $(".users_list").parent().parent().removeClass("required");
        $(".users_list").parent().parent().addClass("optional");
        $(".users_list").parent().prev().removeClass("required");
        $(".users_list").parent().prev().addClass("optional");
        $(".users_list").parent().prev().remove();
        $(".users_list").parent().parent().prepend("<label for='additional_claim_assigned_to' class='select optional control-label'> Assignee </label>")
        }
    else{
        $(".users_list").addClass("required");
        $(".users_list").removeClass("optional");
        $(".users_list").parent().parent().addClass("required");
        $(".users_list").parent().parent().removeClass("optional");
        $(".users_list").parent().prev().addClass("required");
        $(".users_list").parent().prev().removeClass("optional");
        $(".users_list").parent().prev().remove();
        $(".users_list").parent().parent().prepend("<label for='additional_claim_assigned_to' class='select required control-label'><abbr title='required'>*</abbr> Assignee </label>")
    }
    if(($(".alert").length == 1) && $(".status-list").val() != "Unassigned" && $(".users_list").val() == "" )
    {
        if($(".users_list").parent().parent().hasClass("error")== false){
            $(".users_list").parent().parent().addClass("error");
            $(".users_list").parent().append("<span class='help-inline'>can't be blank</span>");
        }
    }
    else{
        $(".users_list").parent().parent().removeClass("error");
        $(".users_list").parent().find("span").remove();
    }
}