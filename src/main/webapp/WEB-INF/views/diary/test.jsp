<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

    <title>파일 다운로드</title>
    
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
    <script type="text/javascript">
    function uploadFile(){
        var form = $('#FILE_FORM')[0];
        var formData = new FormData(form);
        var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
	     
        formData.append("fileObj", $("#FILE_TAG")[0].files[0]);
        formData.append("fileObj2", $("#FILE_TAG2")[0].files[0]);

        $.ajax({
        	url:'${pageContext.request.contextPath}/upload',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
        				console.log("header 실행 "+header+token)
        				//console.log(sentence.toLowerCase());
        			    xhr.setRequestHeader(header, token);
        	      },
                    success: function(result){
                        alert("업로드 성공!!");
                    }
            });
    }




</script>
  </head>
  <body>
<form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
            <input type="file" id="FILE_TAG" name="FILE_TAG">
            <input type="file" id="FILE_TAG2" name="FILE_TAG2">
            <a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">전송</a>
        </form>


  </body>
</html>