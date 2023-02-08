package kh.team2.swith.member.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class ProfileImg {
	private int profile_img_no;
	private List<Profile> nick_name;
	private String profile_img_origin;
	private String profile_img_save;
	private String profile_img_route;
}
