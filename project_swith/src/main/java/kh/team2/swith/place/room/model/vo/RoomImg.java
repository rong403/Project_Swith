package kh.team2.swith.place.room.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class RoomImg {
	private int room_img;
	private String room_img_origin;
	private String room_img_save;
	private String room_img_route;
	private int room_no;
	
	@Override
	public String toString() {
		return "RoomImg [room_img=" + room_img + ", room_img_origin=" + room_img_origin + ", room_img_save="
				+ room_img_save + ", room_img_route=" + room_img_route + ", room_no=" + room_no + "]";
	}
}
