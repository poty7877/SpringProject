package com.happytable.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.happytable.domain.Criteria;
import com.happytable.domain.PageDTO;
import com.happytable.service.RestaurantService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Log4j2
@AllArgsConstructor
@Controller
public class HomeController {

	private RestaurantService serviceRest;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Criteria cri, Model model) {
		model.addAttribute("list", serviceRest.getList(cri));
		int total = serviceRest.getTotal(cri);
		log.info("list: " + model);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "home";
	}

}
