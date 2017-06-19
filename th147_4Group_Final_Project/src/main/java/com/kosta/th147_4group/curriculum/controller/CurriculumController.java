package com.kosta.th147_4group.curriculum.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.th147_4group.curriculum.dao.CurriculumDao;
import com.kosta.th147_4group.curriculum.dao.CurriculumDaoImpl;
import com.kosta.th147_4group.login.dao.MemberDAO;
import com.kosta.th147_4group.message.dao.MessageDao;
import com.kosta.th147_4group.vo.CurriculumVO;
import com.kosta.th147_4group.vo.MessageVO;

@Controller
@RequestMapping("/curriculum")
public class CurriculumController {

	@Autowired
	private CurriculumDao dao;
	
	@Autowired
	private MessageDao mDao;

	@Autowired
	public void setDao(CurriculumDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/curriForm.do")
	public String curriForm() {
		return "curriculum/curriForm";
	}

	@RequestMapping(value = "/curriList.do")
	public String curriList() {

		return "curriculum/curriList";
	}

	@RequestMapping(value = "/principalList.do")
	public String principalForm() {

		return "curriculum/principalList";
	}
	
	@RequestMapping(value = "/subprinList.do")
	public String subprinList() {
		
		return "curriculum/subprinList";
	}

	@RequestMapping(value = "/signChartForm.do")
	public String signChartForm() {

		return "curriculum/signChartForm";
	}

	@RequestMapping(value = "/signForm.do")
	public String signForm() throws SQLException, ClassNotFoundException {

		return "curriculum/signForm";
	}

	@RequestMapping(value = "/curriListPro.do")
	public String curriListPro(Model model, CurriculumVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException {

		List<CurriculumVO> kvoList = new ArrayList<CurriculumVO>();

		vo.setCuClass((String) request.getSession().getAttribute("mClass"));
		vo.setCuGrade((String) request.getSession().getAttribute("grade"));

		System.out.println("<<curriListPro.do>>\n" + vo);

		kvoList = dao.getCurriculumByInfo(vo);

		HashMap map = pagingPro(model, kvoList, 15, request, 0, "", "");

		model.addAttribute("curriList", kvoList);

		model.addAttribute("cu_nowPage", map.get("cu_nowPage"));
		// 총 페이지 블록 수(List)
		model.addAttribute("cu_pageList", map.get("cu_pageList"));

		// 총 게시물 개수 / BLOCK (다음, 이전을 위한 알고리즘)
		model.addAttribute("cu_all_Cnt", map.get("cu_all_Cnt"));

		String page_index_start = (String) map.get("page_index_start");
		String page_index_end = (String) map.get("page_index_end");
		String cu_pageNum = (String) map.get("cu_pageNum");

		return "forward:curriList.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end + "&cu_pageNum=" + cu_pageNum;
	}

	@RequestMapping(value = "/curriDeletePro.do")
	public String curriDeletePro(Model model, CurriculumVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		String cuRnum = request.getParameter("cuRnum");
		System.out.println(cuRnum);
		
		vo.setCuRnum(Integer.parseInt(cuRnum));

		int res = dao.deleteCurriculum(vo);
		System.out.println("컬럼 삭제 여부 : " + res);
		model.addAttribute("deleteResult", res);

		return "forward:curriListPro.do?cu_pageNum=1";
	}

	@RequestMapping(value = "/curriInsertPro.do")
	public String curriAddPro(Model model, CurriculumVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException {

		String cu_pageNum = request.getParameter("cu_pageNum");
		dao.insertCurriculum(vo);

		return "forward:curriListPro.do?cu_pageNum=" + cu_pageNum;
	}

	// 결재상태 별로 가져오는 View
	@RequestMapping(value = "/selectSignInfo.do")
	public String selectSignInfo(Model model, HttpServletRequest request, CurriculumVO vo) throws SQLException, ClassNotFoundException {

		List<CurriculumVO> kvoList = new ArrayList<CurriculumVO>();

		vo.setCuClass((String) request.getSession().getAttribute("mClass"));
		vo.setCuGrade((String) request.getSession().getAttribute("grade"));
		
		vo.setCuFlag(Integer.parseInt(request.getParameter("cuFlag")));
		System.out.println("Flag : " + vo.getCuFlag());
		
		// 결재여부 (0:대기  / 1:승인 / 2: 반려 / 3: 미결) 
		
		if(vo.getCuFlag() == 0){
			vo.setCuSign("0");
			vo.setCuSign2("0");
			System.out.println("결재대기");
		} else if(vo.getCuFlag() == 1) {
			vo.setCuSign("1");
			vo.setCuSign2("1");
			System.out.println("결재승인");
		} else if(vo.getCuFlag() == 2) {
			vo.setCuSign("2");
			vo.setCuSign2("2");
			System.out.println("결재반려");
		} else if(vo.getCuFlag() == 3) {
			vo.setCuSign("3");
			vo.setCuSign2("3");
			System.out.println("결재미결");
		}

		System.out.println("<<selectSignInfo.do>>\n" + vo);

		kvoList = dao.selectSignInfo(vo);
		
		HashMap map = pagingPro(model, kvoList, 15, request, 1, vo.getCuSign(), vo.getCuSign2());

		model.addAttribute("curriList", kvoList);

		model.addAttribute("cu_nowPage", map.get("cu_nowPage"));
		// 총 페이지 블록 수(List)
		model.addAttribute("cu_pageList", map.get("cu_pageList"));

		// 총 게시물 개수 / BLOCK (다음, 이전을 위한 알고리즘)
		model.addAttribute("cu_all_Cnt", map.get("cu_all_Cnt"));

		model.addAttribute("sign_1", vo.getCuSign());
		model.addAttribute("sign_2", vo.getCuSign2());

		String page_index_start = (String) map.get("page_index_start");
		String page_index_end = (String) map.get("page_index_end");
		String cu_pageNum = (String) map.get("cu_pageNum");

		return "forward:curriList.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end + "&cu_pageNum=" + cu_pageNum;
	}

	@RequestMapping(value = "/addSignPro.do", method = RequestMethod.GET)
	public String addSignPro(Model model, HttpServletRequest request, CurriculumVO vo) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		int res = dao.insertCurriculum(vo);
		System.out.println("커리큘럼 리스트 : " + vo);
		System.out.println("커리큘럼 추가 여부 : " + res);

		model.addAttribute("res", res);

		return "curriculum/signForm";
	}

	/* 차트창 */
	@RequestMapping(value = "/signChartPro.do", method = RequestMethod.GET)
	public String signCharList(Model model, CurriculumVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		
		List<CurriculumVO> kvoList = new ArrayList<CurriculumVO>();
		// sign 값 받아오기
		vo.setCuSign(request.getParameter("cuSign"));

		System.out.println("\n<<signChartPro.do>>\n");

		kvoList = dao.getCurriculumByInfo(vo);

		// System.out.println("vo : " + vo);

		model.addAttribute("curriList", kvoList);

		model.addAttribute("sign_1", vo.getCuSign());
		
		if(!kvoList.isEmpty()){
			System.out.println("최종승인여부 : " + kvoList.get(0).getCuSign2());
		}
		
		if( kvoList.size() == 0 || !kvoList.get(0).getCuSign2().equals("1")){
			System.out.println("미승인 / 내용이 없습니다.");
			model.addAttribute("res_chart", "내용이 없습니다.");
		} else {

		/**
		 * 주차별 kvoList 값을 list로 받은 뒤, 그 값들을 이용하여 주차별 각각의 count 값을 구함
		 */

		Map chartMap = new HashMap();
		List<CurriculumVO> chartList = new ArrayList<CurriculumVO>();
		 
		int cnt = 0;
		float cntTotal = 0;
		List selectKoreaList = new ArrayList();
		List selectEnglishList = new ArrayList();
		List selectMathList = new ArrayList();
		List selectScienceList = new ArrayList();
		List selectHistoryList = new ArrayList();
		

		for (CurriculumVO list : kvoList) {
			
			System.out.println("<< kvoList : " + list + " >>");

			vo.setCuDate(list.getCuDate());
			vo.setCuGrade(list.getCuGrade());
			vo.setCuClass(list.getCuClass());
			vo.setCuSubject(list.getCuSubject());
			vo.setCuCategory(list.getCuCategory());
			vo.setCuBungi(list.getCuBungi());

			chartMap.put("cuGrade", vo.getCuGrade());
			chartMap.put("cuClass", vo.getCuClass());
			chartMap.put("cuSubject", vo.getCuSubject());
			chartMap.put("cuCategory", vo.getCuCategory());
			chartMap.put("cuBungi", vo.getCuBungi());

			// System.out.println(list);

			if (vo.getCuSubject().equals("KOREA")) {
				String kCategory = vo.getCuCategory();

				if (kCategory.equals("말하기/듣기")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectKoreaList.add(((float)count/cntTotal)*100.0);
					}
					
					System.out.println("말하기/듣기 총합 : " + cntTotal);
					cntTotal = 0;
					
				} else if (kCategory.equals("쓰기")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);


					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectKoreaList.add(((float)count/cntTotal)*100.0);

					}
					
					System.out.println("쓰기 총합 : " + cntTotal);
					cntTotal = 0;

				} else if (kCategory.equals("읽기")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectKoreaList.add(((float)count/cntTotal)*100.0);

					}
					
					System.out.println("읽기 총합 : " + cntTotal);
					cntTotal = 0;


				} else if (kCategory.equals("문법")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectKoreaList.add(((float)count/cntTotal)*100.0);

					}
					
					System.out.println("문법 총합 : " + cntTotal);
					cntTotal = 0;

				} else if (kCategory.equals("문학")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectKoreaList.add(((float)count/cntTotal)*100.0);

					}
					
					System.out.println("문학 총합 : " + cntTotal);
					cntTotal = 0;

				}

			} else if (vo.getCuSubject().equals("ENGLISH")) {
				String eCategory = vo.getCuCategory();

				if (eCategory.equals("말하기/듣기")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectEnglishList.add(((float)count/cntTotal)*100.0);
					}

				} else if (eCategory.equals("쓰기")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectEnglishList.add(((float)count/cntTotal)*100.0);
					}

				} else if (eCategory.equals("읽기")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectEnglishList.add(((float)count/cntTotal)*100.0);
					}

				} else if (eCategory.equals("문법")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectEnglishList.add(((float)count/cntTotal)*100.0);
					}

				} else if (eCategory.equals("문학")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectEnglishList.add(((float)count/cntTotal)*100.0);
					}

				}

			} else if (vo.getCuSubject().equals("SCIENCE")) {
				String sCategory = vo.getCuCategory();

				if (sCategory.equals("물질")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectScienceList.add(((float)count/cntTotal)*100.0);
					}

				} else if (sCategory.equals("에너지")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectScienceList.add(((float)count/cntTotal)*100.0);
					}

				} else if (sCategory.equals("생명")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectScienceList.add(((float)count/cntTotal)*100.0);
					}

				}

			} else if (vo.getCuSubject().equals("HISTORY")) {
				String hCategory = vo.getCuCategory();

				if (hCategory.equals("경제")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectHistoryList.add(((float)count/cntTotal)*100.0);
					}

				} else if (hCategory.equals("정치")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectHistoryList.add(((float)count/cntTotal)*100.0);
					}

				} else if (hCategory.equals("법")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectHistoryList.add(((float)count/cntTotal)*100.0);
					}

				} else if (hCategory.equals("사회문화")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectHistoryList.add(((float)count/cntTotal)*100.0);
					}

				}

			} else if (vo.getCuSubject().equals("MATH")) {
				String mhCategory = vo.getCuCategory();

				if (mhCategory.equals("수와연산")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectMathList.add(((float)count/cntTotal)*100.0);
					}

				} else if (mhCategory.equals("도형")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectMathList.add(((float)count/cntTotal)*100.0);
					}

				} else if (mhCategory.equals("규칙성")) {
					
					// 전체 count 구하기
					chartMap.put("date1", 1);
					chartMap.put("date2", 20);
					cntTotal = dao.selectChart(chartMap);

					for (int i = 1; i <= 20; i += 3) {
						chartMap.put("date1", i);

						if (i == 19) {
							chartMap.put("date2", (i + 1));
						} else {
							chartMap.put("date2", (i + 2));
						}

						int count = dao.selectChart(chartMap);
						System.out.println("(count/(float)cntTotal)*100.0 : " + (count/cntTotal)*100.0);
						selectMathList.add(((float)count/cntTotal)*100.0);
					}

				} 
			}
		}

			model.addAttribute("selectKoreaList", selectKoreaList);
			model.addAttribute("selectEnglishList", selectEnglishList);
			model.addAttribute("selectScienceList", selectScienceList);
			model.addAttribute("selectHistoryList", selectHistoryList);
			model.addAttribute("selectMathList", selectMathList);
		}

		return "forward:signChartForm.do";

	}

	/**
	 * 
	 * 결재완료 버튼 누르는 액션
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 *
	 */

	@RequestMapping(value = "/submitSignPro.do")
	public String submitSignPro(CurriculumVO vo, HttpServletRequest request) throws ClassNotFoundException, SQLException {


		// 파라미터에 해당하는 Value들을 배열로 가지고 온 뒤,
		String rNum[] = request.getParameterValues("cuRnum");
		
		// 결재 대기 상태로 넘어감
		for (int i = 0; i < rNum.length; i++) {
			System.out.print(rNum[i] + " : ");
			vo.setCuRnum(Integer.parseInt(rNum[i]));
			dao.updateSign(vo);
			
		}
		System.out.println("<< 결재 완료 >>");
		
		MessageVO mVo = new MessageVO();
		
		String grade = (String)request.getSession().getAttribute("grade");
		String mClass = (String)request.getSession().getAttribute("mClass");
		
		mVo.setMeGet("submaster");
		mVo.setMeSend((String)request.getSession().getAttribute("id"));
		mVo.setMeMessage(grade + "학년 " + mClass + "반에서 결재요청이 왔습니다. 결재창을 확인해주세요.");
		
		mDao.insertMessage(mVo);
		System.out.println("<< 쪽지 보내기 완료 >>");

		return "forward:curriListPro.do";
	}

	/* 페이징 처리 부분 */
	public HashMap pagingPro(Model model, List<CurriculumVO> kvoList, int BLOCK, HttpServletRequest request, int signFlag, String signMenu, String signMenu2) throws ClassNotFoundException, SQLException {

		int count = kvoList.size();

		List<Integer> countList = new ArrayList<Integer>();

		Map<String, Object> parameterMap = new HashMap<String, Object>();
		Map<Integer, List> nowPage = new HashMap<Integer, List>();

		// 예를들어, 총 100개의 게시물이라면, 100개를 20으로 나눈 값 (1~5 값)을 List 안에 넣습니다.
		for (int i = 1; i <= Math.ceil((double) count / BLOCK); i++) {
			countList.add(i);

			// countList와 BLOCK을 곱한 값을 nowPage(현재 페이지에 게시물 몇개를 보여줄건지) 에 넣는다.
			parameterMap.put("num1", i * BLOCK - BLOCK + 1);
			System.out.println("parameter : " + parameterMap.get("num1"));
			parameterMap.put("cuGrade", Integer.parseInt(kvoList.get(0).getCuGrade()));
			parameterMap.put("cuClass", Integer.parseInt(kvoList.get(0).getCuClass()));

			// 전체 컬럼의 크기 (ex) 27개 게시물 이 (ex)30개 보다 작다면,
			if (count < i + BLOCK) {
				parameterMap.put("num2", count);
				System.out.println("parameter3 : " + count);

				// 학년, 반 별로 전체보기
				if (signFlag == 0) {
					nowPage.put(i, dao.getNowPageCurriculum(parameterMap));
				}
				// 학년, 반 별로 선택보기
				else if (signFlag == 1) {
					parameterMap.put("cuSign", signMenu);
					parameterMap.put("cuSign2", signMenu2);
					
					System.out.println("sign : " + signMenu);
					System.out.println("sign2 : " + signMenu2);
					
					nowPage.put(i, dao.selectPageSignInfo(parameterMap));
				}
				System.out.println(i);

			} else {
				parameterMap.put("num2", i * BLOCK);
				System.out.println("parameter2 : " + i * BLOCK);

				// 학년, 반 별로 전체보기
				if (signFlag == 0) {
					nowPage.put(i, dao.getNowPageCurriculum(parameterMap));
				}
				// 학년, 반 별로 선택보기
				else if (signFlag == 1) {
					parameterMap.put("cuSign", signMenu);
					parameterMap.put("cuSign2", signMenu2);
					
					System.out.println("sign : " + signMenu);
					System.out.println("sign2 : " + signMenu2);
					
					nowPage.put(i, dao.selectPageSignInfo(parameterMap));
				}
				System.out.println(i);

			}

			System.out.println("nowPage.get(" + i + ") : " + nowPage.get(i));

			parameterMap.clear();
		}
		
		String page_index_start = "0";
		String page_index_end = "10";
		String cu_pageNum = "1";

		if (request.getParameter("page_index_start") != null && request.getParameter("page_index_end") != null) {
			page_index_start = request.getParameter("page_index_start");
			page_index_end = request.getParameter("page_index_end");
		} 
		if (request.getParameter("cu_pageNum") != null) {
			cu_pageNum = request.getParameter("cu_pageNum");
		} 

		HashMap map = new HashMap();

		// 총 페이지 블록 수(Map)
		map.put("cu_nowPage", nowPage);
		// 총 페이지 블록 수(List)
		map.put("cu_pageList", countList);
		// 총 게시물 개수 / BLOCK (다음, 이전을 위한 알고리즘)
		map.put("cu_all_Cnt", ((double) count / BLOCK));

		map.put("page_index_start", page_index_start);
		map.put("page_index_end", page_index_end);
		map.put("cu_pageNum", cu_pageNum);
		

		System.out.println("총 컬럼수 : " + count);

		return map;

	}

	/**
	 * 
	 * 교장 View로 넘어가기전 List 결제여부 (0:보류 / 1:승인 / 2: 반려 / 3: 대기)
	 */
	@RequestMapping(value = "/principalListPro.do")
	public String principalListPro(Model model, CurriculumVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException {

		List<CurriculumVO> kvoList = new ArrayList<CurriculumVO>();
		String t_level = (String) request.getSession().getAttribute("t_level");
		HashMap map = new HashMap();
		String keyword = "";
		
		System.out.println("t_level : " + t_level);
		/**
		 * 교장 View
		 */
		if (t_level.equals("2")) {
			String cuFlag = request.getParameter("cuFlag");
			System.out.println("cuFlag : " + cuFlag);
			keyword = "principal";
			
			if(cuFlag != null) {
			
				if(cuFlag.equals("0")){
					vo.setCuSign2("0");
				} else if(cuFlag.equals("1")){
					vo.setCuSign2("1");
				} else if(cuFlag.equals("2")){
					vo.setCuSign2("2");
				} else {
					System.out.println("전체보기");
				}
				
			}
			
			System.out.println("\n<<교장View : principalListPro.do>>\n" + vo);
			
			if (request.getParameter("cuGrade") != null && request.getParameter("cuClass") != null){

				vo.setCuGrade(request.getParameter("cuGrade"));
				vo.setCuClass(request.getParameter("cuClass"));
				
			}
			
			vo.setCuSign("1");
			kvoList = dao.principalSelect(vo);

			if (vo.getCuClass() == null || vo.getCuGrade() == null) {
				map = pagingPro(model, kvoList, 15, request, 0, "", "");
			} else {
				map = pagingPro(model, kvoList, 15, request, 1, vo.getCuSign(), vo.getCuSign2());
			}
		}

		/**
		 * 교감 View
		 */

		else if (t_level.equals("1")) {	
			String cuFlag = request.getParameter("cuFlag");
			
			keyword = "subprin";
			
			if(cuFlag != null) {
				
				if(cuFlag.equals("0")){
					vo.setCuSign("0");
				} else if(cuFlag.equals("1")){
					vo.setCuSign("1");
				} else if(cuFlag.equals("2")){
					vo.setCuSign("2");
				} else {
					System.out.println("전체보기");
				}
				
			}
			
			System.out.println("\n<<교감View : principalListPro.do>>\n" + vo);

			kvoList = dao.subprinSelect(vo);
			
			if (vo.getCuClass() == null || vo.getCuGrade() == null) {
				map = pagingPro(model, kvoList, 15, request, 0, "","");
			} else {
				map = pagingPro(model, kvoList, 15, request, 1, vo.getCuSign(), vo.getCuSign2());
			}

		} else {
			System.out.println("LEVEL 값이 없습니다. ");
		}

		model.addAttribute("curriList", kvoList);
		System.out.println(kvoList);

		model.addAttribute("cu_nowPage", map.get("cu_nowPage"));
		// 총 페이지 블록 수(List)
		model.addAttribute("cu_pageList", map.get("cu_pageList"));

		// 총 게시물 개수 / BLOCK (다음, 이전을 위한 알고리즘)
		model.addAttribute("cu_all_Cnt", map.get("cu_all_Cnt"));

		String page_index_start = (String) map.get("page_index_start");
		String page_index_end = (String) map.get("page_index_end");
		String cu_pageNum = (String) map.get("cu_pageNum");

		return "forward:"+keyword+"List.do?page_index_start=" + page_index_start + "&page_index_end=" + page_index_end + "&cu_pageNum=" + cu_pageNum + "&cu_sign=" + vo.getCuSign2();
	}

	@RequestMapping(value = "/principalApproveSign.do")
	public String principalApproveSign(Model model, CurriculumVO vo, HttpServletRequest request) throws SQLException, ClassNotFoundException {

		String sign = request.getParameter("sign");
		String cuRnum = request.getParameter("cuRnum");
		String t_level = (String) request.getSession().getAttribute("t_level");
		
		int res = 0;

		System.out.println(sign + " : " + cuRnum + " : " + t_level);

		if(t_level.equals("2")){
			vo.setCuSign2(sign);
			vo.setCuRnum(Integer.parseInt(cuRnum));
			
			System.out.println("\n<<교장 결재 View : principalApproveSign.do>>\n" + vo);
			res = dao.updateSignPrinciPal(vo);
		
		} else if(t_level.equals("1")){
			vo.setCuSign(sign);
			vo.setCuRnum(Integer.parseInt(cuRnum));
			
			// 승인일경우
			if(sign.equals("1")){
				vo.setCuSign2("3");
			}
			
			System.out.println("\n<<교감 결재 View : principalApproveSign.do>>\n" + vo);
			res = dao.updateSignSubprin(vo);
			
			MessageVO mVo = new MessageVO();
			
			mVo.setMeGet("principal");
			mVo.setMeSend("submaster");
			mVo.setMeMessage("교감 선생님으로부터 결재요청이 왔습니다. 결재창을 확인해주세요.");
			
			mDao.insertMessage(mVo);
			System.out.println("<< 쪽지 보내기 완료 >>");

		}

		System.out.println(((sign.equals("1")) ? "승인" : "반려") + "결과 : " + res);
		return "forward:principalListPro.do";
	}
}
