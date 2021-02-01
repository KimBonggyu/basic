package com.bong.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bong.domain.BoardVO;
import com.bong.domain.Criteria;
import com.bong.domain.PageMaker;
import com.bong.domain.ReplyVO;
import com.bong.service.BoardService;
import com.bong.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	//글 작성
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
		logger.info("get write");
	}
	
	//글 작성
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo) throws Exception {
		
		logger.info("post write");
		
		service.write(vo);
		
		return "redirect:/board/listPage";
	}
	
	//글 목록
	@RequestMapping(value="/list", method = RequestMethod.GET	)
	public String list(Model model) throws Exception {
		
		logger.info("get list");
		
		List<BoardVO> list = service.list();
		
		model.addAttribute("list", list);
		return "/board/listPage";
	}
	
	//글 조회
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		logger.info("get read");
		logger.info(cri.toString());
		
		BoardVO vo = service.read(bno);
		model.addAttribute("read", vo);
		
		List<ReplyVO> reply = null;
		reply = replyService.list(bno);
		model.addAttribute("reply", reply);
		
	}
	
	//글 수정
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void getModify(int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		logger.info("get modify");
		logger.info(cri.toString());
		
		BoardVO vo = service.read(bno);
		
		model.addAttribute("modify", vo);
		
	}
	
	//글 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		logger.info("post modify");
		logger.info(cri.toString());
		
		service.update(vo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/listPage";
		
	}
	
	//글 삭제
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		logger.info("post delete");
		logger.info(cri.toString());
		
		service.delete(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/listPage";
		
	}
	
	@RequestMapping(value="/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception {
		
		logger.info("get listCri");
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	//최종 글 목록
	@RequestMapping(value="listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		logger.info("get listPage");
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}

}
