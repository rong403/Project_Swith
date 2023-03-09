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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSchedule() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSchedule() {
		// TODO Auto-generated method stub
		return 0;
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
