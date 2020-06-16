$(document).ready(function(e){
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		
	});
	//<input type='file'>  내용 변경 감지 될때 파일 업로드
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
		  if(fileSize >= maxSize){
			  alert("파일 사이즈 초과");
			  return false;
		  }
		  
		  if(regex.test(fileName)){
			  alert("해당종류의 파일은 업로드 할 수 없습니다.");
			  return false;
		  }
		  return true;
	  }
	  
	  $("input[type='file']").change(function(e){
		  
		  var formData = new FormData();
		  
		  var inputFile = $("input[name='uploadFile']");
		  
		  var files = inputFile[0].files;
		  
		 
		  //add filedata to formdata
		  for(var i=0; i < files.length; i++){
			  if(!checkExtension(files[i].name, files[i].size)){
				  return false;
			  }
			  formData.append("uploadFile", files[i]);
		  }
		  
		  $.ajax({
			  url : '/uploadAjaxAction',
			  processData : false,
			  contentType : false,
			  data : formData,
			  type : 'POST',
			  dataType : 'json',
			  success : function(result){
				  
				  console.log(result);
				  
				  showUploadedFile(result); //업로드 결과 처리
				  				  
			  }
		  });  	//.*ajax
		   
	  });
	  // 섬네일 처리 등
	  	function showUploadResult(uploadResultArr){
	  		
	  		if(!uploadResultArr || uploadResultArr.length == 0){return;}
	  		
	  		var uploadUL = $(".uploadResult ul");
	  		
	  		var str = "";
	  		$(uploadResultArr).each(function(i, obj){
	  			//올리는 파일이 이미지 파일일 경우	
	  			if(!obj.image){
	  					
	  					var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.filName);
	  					str += "<li><div>";
	  					str += "<span> " + obj.fileName + "</span>";
	  					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' " +
	  							"class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	  					str += "<img src='/display?fileName="+fileCallPath+"'>";
	  					str += "</div></li>";
							//올리는 파일이 일반 파일인 경우
	  				} else {
	  					
	  					var fileCallPath = encodeURIComponent(obj.uploadPath 
	  							+ "/" +obj.uuid + "_" + obj.fileName);
	  					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	  					str += "<li><div>";
	  					str += "<span> " + obj.fileName + "</span>";
	  					str += "<button type='button' " +
	  							"data-file=\'"+fileCallPath+"\' data-type='image' " +
	  							"class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	  					str += "<img src='/resources/img/attach.png'>";
	  					str += "</div></li>";
	  					}
	  		});
	  		uploadUL.append(str);
	  }
		// 이미지 파일 변경 /삭제처리
  		$(".uploadResult").on("click", "span", function(e){
  			console.log("delete file");
  			var targetFile = $(this).data("file");
  			var type = $(this).data("type");
  			var targetList = $(this).closest("li");
  			
  			$.ajax({
  				  url : '/deleteFile',
  				  data : {fileName: targetFile, type:type},
  				  type : 'POST',
  				  dataType : 'text',
  				  success : function(result){
  					  alert("result : "+ result);
  					  targetList.remove();
  			}
  		});
  	}); 

});