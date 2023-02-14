package kh.team2.swith.place.room.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class RoomImg {
	private int room_img_no;
	private String room_img_origin;
	private String room_img_save;
	private String room_img_route;
}
