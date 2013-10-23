$(document).ready(function(){
  alert("ok, ill close");
  $('#public_files_open').click(function(){
  alert("ok, ill close");
  });
  
  $('.file_delete').click(function(){
    alert("???????????????");
     $(this).closest("tr").remove();
    $.post("/file/delete",{id: $(this).attr("id")})
  });
  
  
});