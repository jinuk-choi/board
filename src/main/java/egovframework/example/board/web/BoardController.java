package egovframework.example.board.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {
	BoardVO boardVO = null;
	List<?> list = null;

	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value = "/list.do")
	public String list(ModelMap model,
		@ModelAttribute("boardVO") BoardVO boardVO	) throws Exception {
		
		/** EgovPropertyService.sample */
		boardVO.setPageUnit(propertiesService.getInt("pageUnit"));
		boardVO.setPageSize(propertiesService.getInt("pageSize"));
	
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		list = boardService.selectBoardList(boardVO);
		int totCnt = boardService.selectBoardListTotCnt(boardVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		
		model.addAttribute("resultList", list);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "board/list";
	}
	
	@RequestMapping(value = "/view.do")
	public String View(@RequestParam("idx") int idx,ModelMap model) throws Exception {
		
		boardVO = boardService.selectBoard(idx);
		boardService.BoardCount(boardVO);
		
		List<?> list = boardService.selectReplyList(boardVO);
		
		model.addAttribute("boardVO",boardVO);
		model.addAttribute("resultList", list);
		
		return "board/view";
	}
	
	@RequestMapping(value = "/mgmt.do")
	public String mgmt(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		list = boardService.selectBoardList(boardVO);
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/mgmt";
	}
	
	@RequestMapping(value = "/insert.do")
	public String Insert(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		boardService.insertBoard(boardVO);
		list = boardService.selectBoardList(boardVO);
		
		model.addAttribute("resultList", list);
		model.addAttribute("board", boardVO);
		
		return "redirect:/list.do";
	}
	
	@RequestMapping(value = "/edit.do")
	public String Edit(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		boardService.updateBoard(boardVO);
		list = boardService.selectBoardList(boardVO);
		
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
	
	@RequestMapping(value = "/reply.do", method = RequestMethod.POST)
	public String reply(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		boardService.insertReply(boardVO);
		
		return "redirect:/view.do?idx="+boardVO.getIdx();
	}
	
	@RequestMapping(value = "/dreply.do")
	public String dreply(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		boardService.replyDelete(boardVO);
		
		return "redirect:/view.do?idx="+boardVO.getIdx();
	}
	
	@RequestMapping(value = "/edreply.do", method = RequestMethod.POST)
	public String editReply(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		boardService.editComment(boardVO);
		List<?> list = boardService.selectReplyList(boardVO);
		
		
		model.addAttribute("boardVO",boardVO);
		
		return "board/commentList";
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
