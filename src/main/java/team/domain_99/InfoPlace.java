package team.domain_99;

import java.sql.Date;
import java.util.List;

public class InfoPlace {
  int no;
  Date startDate;
  Date lastDate;
  String placeName;
  String basicAddress;
  String detailAddress;
  List<InfoPhotoFile> infoPhotoFiles;
}
