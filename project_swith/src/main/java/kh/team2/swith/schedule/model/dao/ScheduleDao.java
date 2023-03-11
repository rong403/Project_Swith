package kh.team2.swith.schedule.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSchedule(Schedule vo) {
		return sqlSession.insert("schedule.insertSchedule", vo);
		
	}
	public int updateSchedule(Schedule vo) {
		return sqlSession.update("schedule.updateSchedule", vo);
	}
	public int deleteSchedule(String schedule_no) {
		return sqlSession.delete("schedule.deleteSchedule", schedule_no);
	}
	public List<Schedule> selectSchedule(int study_no){
		return sqlSession.selectList("schedule.selectStudySchedule", study_no);
	}
	public List<Schedule> selectSchedule(String member_id){
		return null;
	}
}
