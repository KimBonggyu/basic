package com.bong.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bong.domain.BoardVO;
import com.bong.domain.Page;
import com.bong.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
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
		
		return "redirect:/";
	}
	
	//글 목록
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		
		logger.info("get list");
		
		List<BoardVO> list = service.list();
		
		model.addAttribute("list", list);
	}
	
	//글 조회
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("bno") int bno, Model model) throws Exception {
		
		logger.info("get read");
		
		BoardVO vo = service.read(bno);
		
		model.addAttribute("read", vo);
	}
	
	//글 수정
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		
		logger.info("get modify");
		
		BoardVO vo = service.read(bno);
		
		model.addAttribute("modify", vo);
		
	}
	
	//글 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {
		
		logger.info("post modify");
		
		service.update(vo);
		
		return "redirect:/board/list";
		
	}
	
	//글 삭제
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("bno") int bno) throws Exception {
		
		logger.info("post delete");
		
		service.delete(bno);
		
		return "redirect:/board/list";
		
	}
	
	//게시물 목록 + 페이징 추가
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		logger.info("get listPage");
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.count());
		
		List<BoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);		
		model.addAttribute("select", num);
		
	}
	
	//게시물 목록 + 페이징 추가
	@RequestMapping(value="/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num) throws Exception {

		logger.info("get listPage");
			
		Page page = new Page();
			
		page.setNum(num);
		page.setCount(service.count());
			
		List<BoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
			
		model.addAttribute("list", list);
		model.addAttribute("page", page);		
		model.addAttribute("select", num);
			
	}

}
