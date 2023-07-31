<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	//xml 생성
	String xmlData="<user>";
			xmlData +="<uid>a101</uid>";
			xmlData +="<name>a101</name>";
			xmlData +="<hp>a101</hp>";
			xmlData +="<age>a101</age>";
			xmlData +="</user>";		
	
	// XML 출력
	out.print(xmlData);
	
	
%>