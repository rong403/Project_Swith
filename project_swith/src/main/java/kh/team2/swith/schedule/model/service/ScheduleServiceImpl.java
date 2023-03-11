package kh.team2.swith.schedule.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.schedule.model.dao.ScheduleDao;
import kh.team2.swith.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleDao dao;
	@Override
	public int insertSchedule(Schedule vo) {
		return dao.insertSchedule(vo);
	}

	@Override
	public int updateSchedule(Schedule vo) {
		return dao.updateSchedule(vo);
	}

	@Override
	public int deleteSchedule(String schedule_no) {
		return dao.deleteSchedule(schedule_no);
	}

	@Override
	public List<Schedule> selectSchedule(int study_no) {
		return dao.selectSchedule(study_no);
	}
	
	@Override
	public List<Schedule> selectSchedule(String member_id) {
		return null;
	}

}
