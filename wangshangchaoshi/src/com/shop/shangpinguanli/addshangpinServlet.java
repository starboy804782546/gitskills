package com.shop.shangpinguanli;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * Servlet implementation class addshangpinServlet
 */
@WebServlet("/addshangpinServlet")
public class addshangpinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addshangpinServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SmartUpload su = new SmartUpload();

		// 上传初始化
		su.initialize(getServletConfig(), request, response);
		// 设定上传限制
		// 1.限制每个上传文件的最大长度。
		// su.setMaxFileSize();
		// 2.限制总上传数据的长度。
		// su.setTotalMaxFileSize(20000);
		// 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
		su.setAllowedFilesList("png,jpg,jpeg,gif");
		// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有
		// 扩展名的文件。
		// su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
		// 上传文件

		try {
			su.upload();

		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String path="I:/javaFiles/wangshangchaoshi/WebContent/upload/";
		File f = su.getFiles().getFile(0);
		String url = UUID.randomUUID().toString() + "." + f.getFileExt();
		try {

			
			System.out.println(url);
			f.saveAs(path + url, su.SAVE_AUTO);
		
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 将上传文件全部保存到指定目录，需要先在在Web应用的根目录下，创建一个upload目录

		String name = su.getRequest().getParameter("name");
		String gongyingshang = su.getRequest().getParameter("gongyingshang");
		String shoujia = su.getRequest().getParameter("shoujia");
		String cuxiaojia = su.getRequest().getParameter("cuxiaojia");
		String shengchanriqi = su.getRequest().getParameter("shengchanriqi");
		String baozhiqi = su.getRequest().getParameter("baozhiqi");
		String leibie = su.getRequest().getParameter("leibie");
		String miaoshu = su.getRequest().getParameter("miaoshu");
		String guanjianci = su.getRequest().getParameter("guanjianci");
		String timeyujing = su.getRequest().getParameter("timeyujing");
		String numberyujing = su.getRequest().getParameter("numberyujing");
		String danwei = su.getRequest().getParameter("danwei");
		String tupian= path+url;
		AddshangpinManager shangpinmanager = new AddshangpinManager();
		boolean bl = shangpinmanager.addShangPin(name, gongyingshang, shoujia, cuxiaojia, shengchanriqi, baozhiqi, leibie, miaoshu, guanjianci, timeyujing, numberyujing, danwei, tupian);
		if(bl){
		request.setAttribute("xinxi","添加成功");
			request.getRequestDispatcher("/jsp/h_shangpin.jsp").forward(request, response);
		}else{
			request.setAttribute("xinxi","添加失败");
			request.getRequestDispatcher("/jsp/h_shangpinadd.jsp").forward(request, response);
		}
			

	}
}
