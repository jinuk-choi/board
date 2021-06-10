/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.board.service.impl;

import java.util.List;
import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);

	  @Resource(name="boardMapper")
		private BoardMapper boardDAO;


  public List<?> selectBoardList(BoardVO searchVO) throws Exception {
		return boardDAO.selectBoardList(searchVO);
	}

		
	public String insertBoard(BoardVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		boardDAO.insertBoard(vo);
		return vo.getIdx();
	}
	
	public void updateBoard(BoardVO vo) throws Exception {
		boardDAO.updateBoard(vo);
	}

	
	public void deleteBoard(BoardVO vo) throws Exception {
		boardDAO.deleteBoard(vo);
	}

	
	public BoardVO selectBoard(int idx) throws Exception {
		return boardDAO.selectBoard(idx);
	}
	
	public int selectBoardListTotCnt(BoardVO searchVO) {
		return boardDAO.selectBoardListTotCnt(searchVO);
	}
	
	public void BoardCount(BoardVO vo) {
		boardDAO.BoardCount(vo);
	}
	
	public List<?> selectReplyList(BoardVO searchVO) throws Exception {
		return boardDAO.selectReplyList(searchVO);
	}
	
	public void insertReply(BoardVO vo) throws Exception {
		LOGGER.debug(vo.toString());
		
		boardDAO.insertReply(vo);
		
		if (vo.getbGroup() == 0) {
			boardDAO.updateComment(vo);
		
		} else { 
			boardDAO.updateReComment(vo);
		}
	}
	
	public String selectLoginCheck(BoardVO vo) {
		return boardDAO.selectLoginCheck(vo);
	}
	
	public int replyCount(BoardVO searchVO) {
		return boardDAO.replyCount(searchVO);
	}
	
	public void replyDelete(BoardVO vo) throws Exception {
		boardDAO.replyDelete(vo);
	}
	
	public void editComment(BoardVO vo) throws Exception {
		boardDAO.editComment(vo);
	}

	

}
