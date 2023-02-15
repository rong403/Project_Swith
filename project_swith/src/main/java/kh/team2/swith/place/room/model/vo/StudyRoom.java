package kh.team2.swith.place.room.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import kh.team2.swith.place.model.vo.PlaceInfo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class StudyRoom {
	private int room_no;
	private String room_name;
	private int room_price;
	private String room_start_time;
	private String room_end_time;
	private int room_people;
	private int p_no;
//	private List<PlaceInfo> p_no; //TODO hhjng question
	
	//룸 이미지 
	private String room_img_origin;
	private String room_img_save;
	private String room_img_route;
}
