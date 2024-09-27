package com.happytable.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happytable.domain.MenuImageVO;
import com.happytable.domain.MenuVO;
import com.happytable.domain.RestaurantVO;
import com.happytable.domain.SalesPageDTO;
import com.happytable.domain.SalesVO;
import com.happytable.service.MenuImageService;
import com.happytable.service.MenuService;
import com.happytable.service.OperationsService;
import com.happytable.service.RestaurantService;
import com.happytable.service.SalesService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j2
@RestController
@SessionAttributes({ "loginMember2", "loginResNum", "loggedIn2" }) // session객체에 저장될 내용(사용자 이름, 고유번호, 로그인 여부)
@RequestMapping("/restaurant/**")
public class RestaurantController {
	@Setter(onMethod_ = @Autowired)
	private RestaurantService serviceRest;
	@Setter(onMethod_ = @Autowired)
	private OperationsService serviceOper;
	@Setter(onMethod_ = @Autowired)
	private SalesService serviceSal;
	@Setter(onMethod_ = @Autowired)
	private MenuService serviceMenu;
	@Setter(onMethod_ = @Autowired)
	private MenuImageService serviceMimg;

	// 아이디 중복체크
	@PostMapping(value = "/idcheck", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> idCheck(@RequestBody RestaurantVO vo) {
		String resID = vo.getResID();
		log.info("받은 아이디 : " + resID);
		int cnt = serviceRest.idcheck(resID);
		log.info("중복검색결과 : " + cnt);

		return (cnt > 0) ? new ResponseEntity<>("false", HttpStatus.OK) : new ResponseEntity<>("true", HttpStatus.OK);
		// 0개보다 많이 검색되면 false 값을 result로 보낸다.
	}

	// 로그인(restlogin)
	@PostMapping(value = "/restlogin", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> restAjaxLogin(@RequestBody RestaurantVO rest, Model model) {
		String id = rest.getResID();
		String pw = rest.getResPW();
		log.info("test : 로그인 계정:" + id + "/" + pw);
		int check = serviceRest.loginChech(id, pw);

		if (check == 1) {
			String resNum = serviceRest.login(rest.getResID(), rest.getResPW());
			RestaurantVO loginrest = serviceRest.get(resNum);
			log.info("resNum" + resNum);
			// session생성
			model.addAttribute("loginMember2", loginrest.getResName());// 레스토랑 이름
			model.addAttribute("loginResNum", loginrest.getResNum()); // resNum
			model.addAttribute("loggedIn2", true);
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204(콘텐츠 없음)
		}
	}

	// 테이블 등록정보받기(리스트형 json)
	// **@Controller는 List를 지원하지 않지만, RestController는 List 지원!!!!
	@PostMapping(value = "/regtable", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> tableAjaxReg(@RequestBody List<SalesVO> tables) {
		log.info("test 받은 list data:" + tables);
		int regCnt = 0; // 등록개수
		int total = tables.size(); // 리스트 전체 개수

		for (SalesVO table : tables) { // 리스트 순회하면서 객체별로 db등록
			int result = serviceSal.register(table);
			if (result > 0) {
				regCnt += result;
				table.setReg(true);
			} else {
				table.setReg(false);
			}
		} // --for()
		log.info("---등록개수 : " + regCnt + " / 리스트개수:" + total);
		if (total == regCnt) { // 전체 등록성공
			return new ResponseEntity<>("success", HttpStatus.OK);

		} else {
			return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 테이블 등록(건별-수정페이지에서)
	@PostMapping(value = "/regonetable", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> regOneTable(@RequestBody SalesVO table) {
		log.info("test 받은 data:" + table);
		int result = serviceSal.register(table);
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// U-기본정보 변경
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/modrestAjax", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modRest(@RequestBody RestaurantVO rest) {
		String resNum = rest.getResNum();
		log.info("변경할 resnum:" + resNum);
		boolean result = serviceRest.modify(rest);

		return result ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	// U-테이블 정보 변경
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/restaurant/modtables", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modTables(@RequestBody List<SalesVO> tables) {
		log.info("test 받은 list data:" + tables);
		int modCnt = 0; // 변경개수
		int total = tables.size(); // 리스트 전체 개수

		for (SalesVO table : tables) { // 리스트 순회하면서 객체별로 db등록
			int result = serviceSal.modify(table);
			if (result > 0) {
				modCnt += result;
			} else {
			}
		} // --for()
		log.info("---변경개수 : " + modCnt + " / 리스트개수:" + total);
		if (total == modCnt) { // 전체 등록성공
			return new ResponseEntity<>("success", HttpStatus.OK);

		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// D-테이블 삭제(단일테이블 삭제)
	@DeleteMapping(value = "/restaurant/deltable", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delTable(@RequestBody SalesVO table) {
		log.info("test 삭제할 테이블 :" + table);
		int result = serviceSal.remove(table.getResNum(), table.getTableNum());
		log.info("test 삭제 테이블 개수 :" + result);
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// D-테이블 일괄삭제
	@DeleteMapping(value = "/restaurant/delall/{resNum}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delTableAll(@PathVariable("resNum") String resNum) {
		log.info("test 전체삭제할 테이블resNum :" + resNum);
		int originCnt = serviceSal.countTable(resNum);
		int cnt = serviceSal.removeAll(resNum);
		if (cnt == originCnt) {
			// rttr.addFlashAttribute("delTableCnt", cnt);
			return new ResponseEntity<>(cnt + "", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// R-테이블 리스트 불러오기
	@GetMapping(value = "/gettables/{resNum}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<SalesPageDTO> getTableList(@PathVariable("resNum") String resNum) {
		log.info("test 리스트 읽어올 resNum :" + resNum);
		return new ResponseEntity<>(serviceSal.getTableList(resNum), HttpStatus.OK);
	}

	// R-단일 테이블 불러오기
	@GetMapping(value = "/getonetable/{resNum}/{tableNum}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<SalesVO> getTable(@PathVariable("resNum") String resNum,
			@PathVariable("tableNum") int tableNum) {
		log.info("test 읽어올 resNum/tableNum :" + resNum + "/" + tableNum);
		return new ResponseEntity<>(serviceSal.get(resNum, tableNum), HttpStatus.OK);
	}

	// 메뉴등록
	@PostMapping(value = "/newmenu", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> menuAjaxReg(@RequestBody MenuVO menu) {
		log.info("test 받은 menu:" + menu);
		int cnt = serviceMenu.register(menu);
		log.info("test menu 등록결과:" + cnt);

		return (cnt == 1) ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 메뉴등록(이미지 파일 포함)
	@PostMapping(value = "/regmenufile", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> regmenuFile(@RequestPart MultipartFile menuImg, @RequestPart MenuVO menu) {
		log.info("------------------------");
		log.info("업로드 파일명 : " + menuImg.getOriginalFilename());
		log.info("업로드 파일크기 : " + menuImg.getSize());
		log.info("업로드 메뉴객체 : " + menu);
		//String rstURI = ""; //최종경로

		int cnt = serviceMenu.register(menu); // menunum 획득위한 menu 선등록
		log.info("업로드 menu : " + menu);
		if (cnt != 1) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 파일처리
		MenuImageVO imgvo = makeNewName(menuImg.getOriginalFilename()); // DB 등록을 위한 객체(이름처리 완료)
		String uploaFolder = "D:\\upload";
		String uploadFolderPath = getFolder();
		// 저장폴더준비
		File uploadPath = new File(uploaFolder, uploadFolderPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// 객체준비
		imgvo.setMenuNum(menu.getMenuNum());
		imgvo.setResNum(menu.getResNum());
		imgvo.setUploadPath(uploadFolderPath);
		int imgcnt = 0; // db등록결과 받을 변수

		try {
			// 파일저장->db등록
			File saveFile = new File(uploadPath, imgvo.getSaveName());
			menuImg.transferTo(saveFile);
			imgcnt = serviceMimg.upload(imgvo);

			// 섬네일 제작
			FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + imgvo.getSaveName()));
			Thumbnailator.createThumbnail(menuImg.getInputStream(), thumbnail, 100, 100);
			thumbnail.close();
		} catch (IllegalStateException | IOException e) {
			log.error(e.getMessage());
		}

		if (imgcnt == 1) {
			return new ResponseEntity<>("success",HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 중복파일 방지 : 년/월/일 폴더생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	// 중복파일 방지 : 저장파일명 생성
	private MenuImageVO makeNewName(String originName) {
		MenuImageVO img = new MenuImageVO();
		String ext = originName.substring(originName.lastIndexOf(".")); // 확장자
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		img.setUuid(now);
		img.setOriginName(originName);
		img.setSaveName(now + ext);
		return img;

	}

}
