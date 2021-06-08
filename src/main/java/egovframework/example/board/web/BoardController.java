package egovframework.example.board.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.Pagination;

@Controller
public class BoardController {
	BoardVO boardVO = null;
	List<?> list = null;
	Pagination pagination;
	int count = 0;
	int page = 1;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	
	@RequestMapping(value = "/list.do")
	public String list(ModelMap model
						) throws Exception {

		
		
		count = boardService.selectBoardListTotCnt(boardVO);
		pagination = new Pagination(page, count);
		list = boardService.selectBoardList(pagination);
		
		model.addAttribute("resultList", list);
		model.addAttribute("pagination", pagination);
		
		return "board/list";
	}
	
	@RequestMapping(value = "/view.do")
	public String View(@RequestParam("idx") int idx,ModelMap model) throws Exception {
		
		boardVO = boardService.selectBoard(idx);
		boardService.BoardCount(boardVO);
		
		list = boardService.selectBoardList(pagination);
		
		model.addAttribute("boardVO",boardVO);
		model.addAttribute("resultList", list);
		
		return "board/view";
	}
	
	@RequestMapping(value = "/mgmt.do")
	public String mgmt(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		list = boardService.selectBoardList(pagination);
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/mgmt";
	}
	
	@RequestMapping(value = "/insert.do")
	public String Insert(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		boardService.insertBoard(boardVO);
		list = boardService.selectBoardList(pagination);
		
		model.addAttribute("resultList", list);
		model.addAttribute("board", boardVO);
		
		return "redirect:/list.do";
	}
	
	@RequestMapping(value = "/edit.do")
	public String Edit(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		boardService.updateBoard(boardVO);
		list = boardService.selectBoardList(pagination);
		
		model.addAttribute("resultList", list);
		model.addAttribute("board", boardVO);
		
		return "redirect:/list.do";
	}
	
	@RequestMapping(value = "/delete.do")
	public String Delete(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		boardService.deleteBoard(boardVO);
		
		model.addAttribute("board", boardVO);
		
		return "redirect:/list.do";
	}
	
	
	
	
	

	@RequestMapping(value = "/login.do")
	public String login(@RequestParam("user_id") String user_id,
						@RequestParam("password") String password,
						ModelMap model,HttpServletRequest request) throws Exception {
		
		System.out.println("user_id:"+user_id);
		System.out.println("password:"+password);
		
		BoardVO boardVo = new BoardVO();
		boardVo.setUserId(user_id);
		boardVo.setPassword(password);
		String user_name = boardService.selectLoginCheck(boardVo);
		
		if(user_name != null && !"".equals(user_name))	{
			request.getSession().setAttribute("userId",user_id);
			request.getSession().setAttribute("userName",user_name);
		}else {
			request.getSession().setAttribute("userId","");
			request.getSession().setAttribute("userName","");
			model.addAttribute("msg","사용자정보가올바르지않아요");
		}
		
		return "redirect:/list.do";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(ModelMap model,HttpServletRequest request) throws Exception {
		
		request.getSession().invalidate();
		return "redirect:/list.do";
	}
	
}
