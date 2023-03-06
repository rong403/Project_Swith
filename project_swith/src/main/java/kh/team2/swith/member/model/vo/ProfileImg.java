package kh.team2.swith.member.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Component
public class ProfileImg {
	private String member_id;
	private String profile_img_origin;
	private String profile_img_save;
	private String profile_img_route;
}
