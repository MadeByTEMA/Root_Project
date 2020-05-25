package com.keep.root.web;

import java.io.File;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.keep.root.domain.Review;
import com.keep.root.domain.ReviewDay;
import com.keep.root.domain.ReviewPlace;
import com.keep.root.domain.ReviewPlacePhoto;
import com.keep.root.domain.User;
import com.keep.root.service.ReviewDayService;
import com.keep.root.service.ReviewPlacePhotoService;
import com.keep.root.service.ReviewPlaceService;
import com.keep.root.service.ReviewService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	static Logger logger = LogManager.getLogger(ReviewController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  ReviewService reviewService;

  @Autowired
  ReviewDayService reviewDayService;

  @Autowired
  ReviewPlaceService reviewPlaceService;
  
  @Autowired
  ReviewPlacePhotoService reviewPlacePhotoService;


  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form() {}

  @RequestMapping("add")
  public String add(//
      HttpSession session, //
      int status,

      MultipartFile mainPhoto, //
      String title, //
      Date dayDate, //
      String mainReview, //
      int dayStatus, //

      String name, //
      String basicAddr, //
      String detailAddr, //
      String placeReview, //
      MultipartFile mainPlacePhoto, //
      int placeStatus, //

      MultipartFile[] PlacePhotos, //
      Review review) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("유저 번호가 유효하지 않습니다.");
    }
    review.setUser(user);

    List<ReviewPlacePhoto> reviewPlacePhotos = new LinkedList<>();
    for (MultipartFile photoFile : PlacePhotos) {
      if (photoFile.getSize() > 0) {
        ReviewPlacePhoto revivewplacephoto = new ReviewPlacePhoto();
        String dirPath = servletContext.getRealPath("/upload/review");
        String filename = UUID.randomUUID().toString();
        photoFile.transferTo(new File(dirPath + "/" + filename));
        revivewplacephoto.setPhoto(filename);
        reviewPlacePhotos.add(revivewplacephoto);
      }
    }
    for (ReviewPlacePhoto reviewPlacePhoto : reviewPlacePhotos) {
      System.out.printf("저장 된 파일 이름이야 !! %s \n", reviewPlacePhoto.getPhoto());
    }

    ReviewPlace reviewplace =
        new ReviewPlace(name, basicAddr, detailAddr, placeReview, placeStatus, reviewPlacePhotos);
    if (mainPlacePhoto.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/review");
      String filename = UUID.randomUUID().toString();
      mainPlacePhoto.transferTo(new File(dirPath + "/" + filename));
      reviewplace.setMainPhoto(filename);
    }

    List<ReviewPlace> reviewplaces = new LinkedList<>();
    reviewplaces.add(reviewplace);

    ReviewDay reviewday = new ReviewDay(title, dayDate, mainReview, dayStatus, reviewplaces);
    if (mainPhoto.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/review");
      String filename = UUID.randomUUID().toString();
      mainPhoto.transferTo(new File(dirPath + "/" + filename));
      reviewday.setMainPhoto(filename);
    }

    List<ReviewDay> reviewdays = new LinkedList<>();
    reviewdays.add(reviewday);

    review.setReviewDay(reviewdays);
    reviewService.add(review);
    return "redirect:list?userNo=" + user.getNo();
  }

  @GetMapping("list")
  public void list(HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    model.addAttribute("list", reviewService.list(user.getNo()));
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("review", reviewService.get(no));
  }

  @GetMapping("delete")
  public String delete(int no, int userNo) throws Exception {
    reviewService.delete(no);
    return "redirect:list?userNo=" + userNo;
  }

  // 로그인 공개 or 모두 공개 
  // 초안 : 디테일은 로그인 공개
  @GetMapping("search")
  public void search(String keyword, HttpSession session, Model model) throws Exception {
    model.addAttribute("searchDayList", reviewDayService.search(keyword));
    model.addAttribute("searchPlaceList", reviewPlaceService.search(keyword));
    logger.info(model);
    logger.debug(model);
  }
  
  @GetMapping("searchDayDetail")
  public void searchDayDetail(int no, HttpSession session, Model model) throws Exception {
	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser == null) {
	  throw new Exception("로그인이 필요합니다.");
	}
	model.addAttribute("review", reviewService.get(no));
    logger.info(model);
    logger.debug(model);
  }
  
  @GetMapping("searchPlaceDetail")
  public void searchPlaceDetail(int no,  HttpSession session, Model model) throws Exception {
	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser == null) {
		  throw new Exception("로그인이 필요합니다.");
	}
	
	model.addAttribute("loginUser",loginUser);
	model.addAttribute("review", reviewService.getByPlaceNo(no));
    model.addAttribute("placeDetail", reviewPlaceService.searchPlaceGet(no));
    model.addAttribute("placePhotoDetail", reviewPlacePhotoService.listGet(no));
    logger.info(model);
    logger.debug(model);
  }
}
