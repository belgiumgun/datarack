;$(document).ready(function(){
 


  $('.record_delete').click(function(){
      $(this).closest("tr").remove();
    $.post("/record/delete",{id: $(this).attr("data-number")});
  
  });
  
  
  
  
  
  
  
  $('.details_view').click(function(){
      $("#myModal").modal("show");
    
    $('.modal-dialog').css({"right":"auto","left":"50%","width":"75%","padding-top":"30px","padding-bottom":"30px"});
     
    $.post("/candidate/details_show",{record_id: $(this).attr("data-record")});
  
  });
  
  
  $('.file_delete').click(function(){
     $(this).closest("tr").remove();
    $.post("/file/delete",{id: $(this).attr("id")});
  });
  
  $("#filerack_datafile").change(function(data){
    var f = data.files[0];
    if(f)
    {
    }
    else
    {alert("Unable to load the file!");}
    
  });
 
  
  $('.record_edit').click(function(){
    
    
      
    $("#myModal").modal("show");
    
    $('.modal-dialog').css({"right":"auto","left":"50%","width":"75%","padding-top":"30px","padding-bottom":"30px"});
    $.post('record/edit',{record_id: $(this).attr("data-record")});     
  
  });
  

  
  

  
});