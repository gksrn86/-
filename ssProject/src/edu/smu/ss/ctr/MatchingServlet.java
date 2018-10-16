package edu.smu.ss.ctr;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import edu.smu.ss.dao.MatchingDao;
import edu.smu.ss.vo.local;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@WebServlet("/Matching.do")
public class MatchingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		switch (request.getParameter("action")) {
		case "matching":
			matching(request, response);
			break;
		case "img_search":
			img_search(request, response);
			break;
		case "insertMenu":
			insertMenu(request, response);
			break;
		}

	}

	protected void matching(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MatchingDao dao = new MatchingDao();
		ArrayList<String> foodList = new ArrayList<>();
		int s0 = Integer.parseInt(request.getParameter("mainCategory"));
		int s1 = Integer.parseInt(request.getParameter("menBob"));
		int s2 = Integer.parseInt(request.getParameter("soup"));
		int s3 = Integer.parseInt(request.getParameter("meat"));
		int s4 = Integer.parseInt(request.getParameter("seafood"));
		int s5 = Integer.parseInt(request.getParameter("spicy"));
		int s6 = Integer.parseInt(request.getParameter("hot"));
		int[] rfArr = new int[] { s0, s1, s2, s3, s4, s5, s6 };
		try {
			foodList = dao.result(rfArr);
			request.setAttribute("result", foodList);
			request.getRequestDispatcher("resultPage.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void insertMenu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MatchingDao dao = new MatchingDao();
		String foodName = request.getParameter("fname");
		int s0 = Integer.parseInt(request.getParameter("mainCategory"));
		int s1 = Integer.parseInt(request.getParameter("menBob"));
		int s2 = Integer.parseInt(request.getParameter("soup"));
		int s3 = Integer.parseInt(request.getParameter("meat"));
		int s4 = Integer.parseInt(request.getParameter("seafood"));
		int s5 = Integer.parseInt(request.getParameter("spicy"));
		int s6 = Integer.parseInt(request.getParameter("hot"));
		int[] cArr = new int[] { s0, s1, s2, s3, s4, s5, s6};
		try {
			dao.insertFoodName(foodName);
			dao.insertCategory(foodName, cArr);
			request.setAttribute("insertResult", "success");
			request.getRequestDispatcher("myPage.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void img_search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fname = request.getParameter("fname");
		String clientId = "k9m9by0lc6owx9OsMymQ";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "PBHMXptnee";// 애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode(fname, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/image.xml?query=" + text; // json 결과

			Document doc = Jsoup.connect(apiURL).header("X-Naver-Client-Id", clientId)
					.header("X-Naver-Client-Secret", clientSecret).get();
			Elements items = doc.select("item"); // 셀렉트를 사용하면 배열로 담김

			ArrayList<HashMap<String, String>> list = new ArrayList<>(); // HashMap:Attr식 배열
			for (Element element : items) {
				HashMap<String, String> map = new HashMap<>();
				map.put("title", element.selectFirst("title").text());
				map.put("link", element.selectFirst("link").text());
				map.put("thumbnail", element.selectFirst("thumbnail").text());
				map.put("sizeheight", element.selectFirst("sizeheight").text());
				map.put("sizewidth", element.selectFirst("sizewidth").text());
				list.add(map);
			}
			request.setAttribute("img_list", list);
			request.setAttribute("fname", fname);
			search(request, response);
			request.getRequestDispatcher("resultPage2.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nextPage = "resultPage2.jsp";
		String clientId = "88fam_xei51Qh24aD7Q9";
		String clientSecret = "Yb3PmIFtHL";

		
		try {
			String text = URLEncoder.encode(request.getParameter("fname"), "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text;

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response1 = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response1.append(inputLine);
			}
			br.close();
			String json = response1.toString();

			JSONObject jo = new JSONObject(json);
			JSONArray ja = jo.getJSONArray("items");
			ArrayList<local> list = new ArrayList<>();
			for (Object obj : ja) {
				JSONObject jo2 = (JSONObject) obj;

				local lo = new local(jo2.getString("title"), jo2.getString("link"), jo2.getString("description"),
						jo2.getString("telephone"), jo2.getString("address"), jo2.getString("roadAddress"),
						jo2.getInt("mapx"), jo2.getInt("mapy"));
				list.add(lo);
			}
			request.setAttribute("list", list);

		} catch (Exception e) {
			System.out.println(e);
		}
//		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}