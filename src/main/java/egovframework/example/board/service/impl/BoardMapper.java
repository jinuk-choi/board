/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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

import egovframework.example.board.service.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("boardMapper")
public interface BoardMapper {

	List<?> selectBoardList(BoardVO searchVO) throws Exception;
	
	void insertBoard(BoardVO vo) throws Exception;
	
	void updateBoard(BoardVO vo) throws Exception;
	
	void deleteBoard(BoardVO vo) throws Exception;

	BoardVO selectBoard(BoardVO vo) throws Exception;

	int selectBoardListTotCnt(BoardVO searchVO);
	
	void BoardCount(BoardVO vo);
	
	String selectLoginCheck(BoardVO vo);
	
	List<?> selectReplyList(BoardVO searchVO) throws Exception;
	
	void insertReply(BoardVO vo) throws Exception;
	
	int replyCount(BoardVO searchVO);
	
	void replyDelete(BoardVO vo) throws Exception;
	
	void editComment(BoardVO vo) throws Exception;
	
	void updateComment(BoardVO vo) throws Exception;
	
	void updateReComment(BoardVO vo) throws Exception;
	
	void updateEdBoard(BoardVO vo) throws Exception;
	
	void updateReBoard(BoardVO vo) throws Exception;
	
	void insertUser(BoardVO vo) throws Exception;
	
	
	


}
