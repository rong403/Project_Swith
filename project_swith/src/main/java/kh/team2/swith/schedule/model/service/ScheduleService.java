package kh.team2.swith.schedule.model.service;

import java.util.List;

import kh.team2.swith.member.model.vo.Member;
import kh.team2.swith.schedule.model.vo.Schedule;
import kh.team2.swith.study.model.vo.Study;

public interface ScheduleService {
	public int insertSchedule(Schedule vo);
	public int updateSchedule(Schedule vo);
	public int deleteSchedule(String schedule_no);
	public List<Schedule> selectSchedule(int study_no);
	public List<Schedule> selectSchedule(List<Study> list);
}
