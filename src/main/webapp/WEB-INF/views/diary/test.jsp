<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>파일 다운로드</title>
  </head>
  <body>
  	<div class="content">
		<br/><br/>
		<h3>파일 업로드</h3>
		<form action="upload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
			<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>
		  
		  <table>
		    <tr>
		      <td>Select File</td>
		      <td><input type="file" name="uploadFile" /></td>
		      <td>
		        <button type="submit">Upload</button>
		      </td>
		    </tr>
		  </table>
		</form>
	</div>
  </body>
</html>