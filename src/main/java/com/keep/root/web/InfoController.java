package com.keep.root.web;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keep.root.domain.Info;
import com.keep.root.service.InfoService;

@Controller
@RequestMapping("/info")
public class InfoController {

  static Logger logger = LogManager.getLogger(InfoController.class);

  @Autowired
  InfoService infoService;


  @RequestMapping("detail")
  public void detail(int no, Map<String, Object> model) throws Exception {
    Info info = infoService.get(no);
    model.put("info", info);
  }

  @RequestMapping("list")
  public void list(Map<String, Object> model) throws Exception {
	  System.out.println("호출1");
    List<Info> infos = infoService.list();
	  System.out.println("호출2");
    model.put("list", infos);
	  System.out.println("호출3");
  }

}
