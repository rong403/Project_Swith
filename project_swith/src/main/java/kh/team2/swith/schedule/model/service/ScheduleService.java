package kh.team2.swith.schedule.model.service;

import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.schedule.model.vo.Schedule;

public interface ScheduleService {
	public int insertSchedule(Schedule vo);
	public int updateSchedule();
	public int deleteSchedule();
	public Schedule selectSchedule(String member_id);
}
