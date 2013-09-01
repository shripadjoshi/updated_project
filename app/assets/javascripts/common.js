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

$("#additional_claim_claim_type").live("change", function(){
    $(".dvLoading").show();
    $.ajax({
        url: '/products/'+ $("#product_val").val() +'/additional_claims/users',
        type : "GET",
        data : { claim_type : $(this).val()},
        success: function(data) {
            //change_assignee_label();
            $(".dvLoading").hide();
        }
    });
});

$(".status-list").live("change", function(){
  change_user_label($(".users_list"),$(".status-list"),'Assignee')
});

$(".copy-status-list").live("change", function(){
  change_user_label($(".editor_users_list"),$(".copy-status-list"),'Editor')
});


function change_user_label(user_list,status_list,display_text)
{
   if(status_list.val() == "Unassigned"){
      user_list.removeClass("required");
      user_list.addClass("optional");
      user_list.parent().parent().removeClass("required");
      user_list.parent().parent().addClass("optional");
      user_list.parent().prev().removeClass("required");
      user_list.parent().prev().addClass("optional");
      user_list.parent().prev().remove();
      user_list.parent().parent().prepend("<label for='additional_claim_'"+display_text.toLowerCase()+"' class='select optional control-label'> "+ display_text +" </label>")
   }
   else{
     user_list.addClass("required");
     user_list.removeClass("optional");
     user_list.parent().parent().addClass("required");
     user_list.parent().parent().removeClass("optional");
     user_list.parent().prev().addClass("required");
     user_list.parent().prev().removeClass("optional");
     user_list.parent().prev().remove();
     user_list.parent().parent().prepend("<label for='additional_claim_'"+display_text.toLowerCase()+"' class='select required control-label'><abbr title='required'>*</abbr> "+ display_text +" </label>")
   }
   if(($(".alert").length == 1) && status_list.val() != "Unassigned" && user_list.val() == "" )
    {
        if(user_list.parent().parent().hasClass("error")== false){
            user_list.parent().parent().addClass("error");
            user_list.parent().append("<span class='help-inline'>can't be blank</span>");
        }
    }
    else{
        user_list.parent().parent().removeClass("error");
        user_list.parent().find("span").remove();
    }
    
}
