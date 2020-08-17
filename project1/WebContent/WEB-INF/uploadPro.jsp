<%@page import="java.io.IOException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.org.cloud.CloudDAO"%>
<%@page import="com.org.cloud.CloudDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	if (<%=session.getAttribute("signedUser") == null%>) {
		alert("로그인 후 이용가능합니다");
		window.location = "login.ws";
	} 
</script>
<!-- D:\2020java\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\현재 프로젝트명\upload : 저장되는 경로 -->
<%
	String id = (String) session.getAttribute("signedUser");
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
	String filepath = application.getRealPath("/upload/" + id + "/" + strdate + "/");
	int limitsize = 1024 * 1024 * 10; //10MB

	MultipartRequest mr = null;
	String filename = "";
	double filesize = 0;

	try {
		File folder = new File(filepath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		mr = new MultipartRequest(request, filepath, limitsize, //10MB
				"utf-8", new DefaultFileRenamePolicy());

		Enumeration<?> files = mr.getFileNames();
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			filename = mr.getFilesystemName(name);
			File file = mr.getFile(name);

			if (file != null) {
				filesize = (double) file.length() * 0.00000095367;
			}
		}

		CloudDTO cDTO = new CloudDTO();

		cDTO.setId(id);
		cDTO.setFilename(filename);

		String title = mr.getParameter("title");
		if (title != null && !(title.equals(""))) {
			cDTO.setTitle(title);
		}

		String content = mr.getParameter("content");
		if (content != null && !(content.equals(""))) {
			cDTO.setContent(content);
		}

		cDTO.setUpload_date(strdate);
		cDTO.setFilesize(String.format("%.2f", filesize) + "MB");

		CloudDAO cDAO = CloudDAO.getInstance();

		int x = cDAO.insert(cDTO);

		if (x == 1) {
			response.sendRedirect("mycloud.ws");
		} else {
			out.println("<script>alert('업로드 실패 : 작성 오류');history.back();</script>");
			cDAO.deleteFile(filepath, filename);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
