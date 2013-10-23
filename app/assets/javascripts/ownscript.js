$(document).ready(function(){
 // alert("ok, ill close");
  //$("#files_pannel").css("display:none");
  $('#public_files_open').click(function(){
  //alert("ok, ill close");
  });
  
  $('.file_delete').click(function(){
    //alert("???????????????");
     $(this).closest("tr").remove();
    $.post("/file/delete",{id: $(this).attr("id")})
  });
  

  $("#file_uploader").change(function(){
   alert("wasup");
  //  $("#file_list").append("<p>"+current_file.name+current_file.size+"</p><br/>");
  var temp_files=this.files;
    $("#files_pannel").css("display:inline");
    for (var i=0,current_file; current_file=temp_files[i];i++)
    {
      //$("#body_table").append("<tr><td>"+current_file.name+"</td><button class='btn btn-sm'>delete</tr>");
      $("#body_table").append("<tr><td>"+current_file.name+"</td>"+"<td><button class='btn btn-sm btn-danger'>Delete<span class='glyphicon glyphicon-remove'></span>"+"</button></td></tr>");
      
     
    }
    
    
    
  });


  
});