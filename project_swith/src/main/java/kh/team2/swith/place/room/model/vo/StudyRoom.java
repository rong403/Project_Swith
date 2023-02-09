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
	private Date room_time;
	private int room_people;
	private List<PlaceInfo> p_no;
}
