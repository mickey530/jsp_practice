package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletCustom
 */
@WebServlet("/calmdown")
public class ServletCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCustom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("calmdown 접속 완료");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("/calmdown 접속시 생성된 객체는 서버 종료로 인해 파기됩니다.");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get방식으로 해당 주소에 접속할 때마다 실행해주는 메서드.
		System.out.println("/calmdown 주소 접속 확인");
		// request.getParameter() 를 이용해
		// "jsp", "boot" 라는 이름으로 들어온 요소를 콘솔에 찍도록 아래 코드를 작성하고
		// doGet메서드를 복사해서 보내주세요.
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		System.out.println("jsp : " + jsp + " / boot : " + boot);
		
		String jpa = request.getParameter("jpa");
		System.out.println("jpa : " + jpa);
		
		// 리다이렉트 방식은 페이지만 이동시키고 데이터는 같이 전송하지 않습니다.
		// response.sendRedirect("http://localhost:8181/MyfirstWeb/servletForm/calmdownResult.jsp");
		// request.setAttribute("보낼이름", 자료);
		request.setAttribute("jsp", jsp);
		request.setAttribute("boot", boot);
		request.setAttribute("jpa", jpa);
		// 상단 변수를 함께 전달하기 위해 forward를 대신 사용합니다.
		// 목적지 주소는 localhost:포트번호/프로젝트명/이후경로 > "/이후경로"
		RequestDispatcher dp = request.getRequestDispatcher("/servletForm/calmdownResult.jsp");
		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doPost는 현재까지 배운 내용만 놓고 봤을때는 form에서 Post방식으로 제출될 때 호출됩니다.
		System.out.println("/calmdown 주조 post방식으로 접속");
		// servletFrom 내부에 있던 ~~~~~Form.jsp 의 목적지는 그대로 두고
		// 전송 방식만 post로 바꿔서 데이터를 날려주고
		// 받아서 처리해주세요.
		// 대신 post방식으로 전송됨을 구분하기 위해서
		// System.out.println("post방식 : " + 변수명);
		request.setCharacterEncoding("utf-8");
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		String jpa = request.getParameter("jpa");
		System.out.println("post방식 : " + jsp + boot + jpa);

		// 아래 redirect방식 대신, calmdownPostResult.jsp 를 생성한 뒤
		// post방식 처리시 포워딩으로 jsp, boot, jpa 변수가 화면에 표출되도록 해주세요.
		// response.sendRedirect("http://localhost:8181/MyfirstWeb/servletForm/calmdownResult.jsp");
		// 1. request.setAttribute()를 이용해 포워딩 목적지로보낼 데이터 바인딩(저장)
		request.setAttribute("jsp", jsp);
		request.setAttribute("boot", boot);
		request.setAttribute("jpa", jpa);
		// 포워딩
		RequestDispatcher dp = request.getRequestDispatcher("/servletForm/calmdownPostResult.jsp");
		dp.forward(request, response);
	}

}
