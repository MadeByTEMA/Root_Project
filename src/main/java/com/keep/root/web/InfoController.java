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
    Info infos = infoService.get(no);
    model.put("info", infos);
  }

  @RequestMapping("list")
  public void list(Map<String, Object> model) throws Exception {
    List<Info> infos = infoService.list();
    model.put("list", infos);
  }

  

}
