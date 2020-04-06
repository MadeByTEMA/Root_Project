package team.test.jwDomain;

import java.sql.Date;
import java.util.List;

public class Review {
	
	int count;					//리뷰번호
	int no;						//유저번호
	int placeNo;				//장소리뷰번호
	int day;					//데이리뷰번호
	String photo;				//대표사진
	String title;				//데이제목
	Date dayDate;				//데이일자
	List<Review> dayReview;		//데이후기
	String place;				//장소명
	String address;				//주소
	List<Review> placeReview;	//장소후기
	Date date;					//작성일
	int status;					//작성상태

}
