package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CampingListallAction;
import action.NoticeListallAction;
import action.QuestionDeleteAction;
import action.QuestionListTotalAction;
import action.QuestionUpdate01Action;
import action.QuestionUpdate02Action;
import action.QuestionWriteAction;
import vo.ActionForward;

/**
 * Servlet implementation class CmFrontController
 */
@WebServlet("*.co")
public class CmFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CmFrontController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		// path가 .jsp로 넘어오지 않고 .co로 넘어오는 경우 command값에 /view가 같이 넘어와서 제거해줘야함
		command = command.replace("/view", "");
		
		/* DB작업을 안하면 이렇게 쓰면 됨 */
		if(command.equals("/marketMain.co")){
			forward=new ActionForward();
			forward.setPath("/view/HCAM_marketMain.jsp");
		}
		/* DB작업을 하면 아래와 같이 */
		else if(command.equals("/campingMain.co")){
			action = new CampingListallAction();	//CampingListallAction 부르고 action 안에 담기
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeMain.co")){
			action = new NoticeListallAction();	//NoticeListallAction 부르고 action 안에 담기
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/questionMain.co")){
			action = new QuestionListTotalAction();	//QuestionListallAction 부르고 action 안에 담기
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberQuestionWrite01.co")){
			forward=new ActionForward();
			forward.setPath("/view/HCAM_memberQuestionWrite.jsp");
		}
		else if(command.equals("/memberQuestionWrite02.co")){
			action = new QuestionWriteAction();	//QuestionListallAction 부르고 action 안에 담기
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberQuestionUpdate01.co")){
			action = new QuestionUpdate01Action();	
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberQuestionUpdate02.co")){
			action = new QuestionUpdate02Action();	
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberQuestionDelete.co")){
			action = new QuestionDeleteAction();	
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
}
