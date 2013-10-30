$(document).ready(function(){
 
  var global_files;
  
  $('#public_files_open').click(function(){
  
  });
 
  $("#search_submit").click(function(){
  
  
  });
  
  
  $('.file_delete').click(function(){
     $(this).closest("tr").remove();
    $.post("/file/delete",{id: $(this).attr("id")});
  });
  

  $("#file_uploader").change(function(){
   alert("wasup");
  var temp_files=this.files;
    $("#files_pannel").css("display:inline");
    for (var i=0,current_file; current_file=temp_files[i];i++)
    {
      $("#body_table").append("<tr><td><div style='display:none' type='file'>"+current_file+"</div>"+current_file.name+"</td>"+"<td><div class='file_remove'><button class='btn btn-sm btn-danger'>Delete<span class='glyphicon glyphicon-remove'></span>"+"</button></div></td></tr>");
     }
    
              $('.file_remove').click(function(){
               // $("#file_uploader").files.pop("abc.txt");
                 $(this).closest("tr").remove();
              
              }); 
    
  });

 

  
  

  
});