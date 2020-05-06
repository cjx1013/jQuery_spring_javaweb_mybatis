<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//创建异步对象
function createXMLHttpRequest(){
	try{
		return new XMLHttpRequest();//大多数浏览器`
	}catch(e){
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");//IE6.0
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");//IE5.5及更早版本
			} catch (e) {
				alert("哥们，你用的是什么浏览器啊！");
				throw e;
			}
		}
	}
	
}

window.onload = function(){//文档加载完毕后执行
	var btn=document.getElementById("btn");
	btn.onclick=function(){//给按钮的点击事件注册监听
		/*
		ajax四步操作，得到服务器响应
		把响应结果显示到h1元素中
		*/
		/*
		1.得到异步对象
		*/
		var xmlHttp=createXMLHttpRequest();
	
		/*
		2.打开与服务器的连接
			*指定请求方式
			*指定请求的URL
			*指定是否为异步请求
		*/
		//修改open方法，指定请求方式为POST
		xmlHttp.open("POST","<c:url value='/Aservlet'/>",true);
		//设置请求头
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		/*
		3.发送请求
		*/
		//发送时指定请求体
		xmlHttp.send("username=张三&&password=123");//GET请求没有请求体，但也要给出null，不然FireFox可能会不能发送
		
		/*
		4.给异步对象的onreadstatechange事件注册监听器
		*/
		xmlHttp.onreadystatechange=function(){//当xmlHttp的状态发生变化时执行
			//双重判断：xmlHttp的状态为4,（服务器响应结束），以及服务器响应的状态码为200（响应成功）
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
				//获取服务器的响应结束
				var text=xmlHttp.responseText;
				//获取h1元素
				var h1=document.getElementById("h1");
				h1.innerHTML=text;
			}		
		};
	};
};
</script>
</head>
<body>
	<button type="button" id="btn">点击</button>
	<h1 id="h1"></h1>
</body>
</html>