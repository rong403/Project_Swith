package kh.team2.swith.reserve.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.team2.swith.reserve.model.dao.ReserveDao;
import kh.team2.swith.reserve.model.vo.CancelReserveInfo;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{
	@Autowired
	private ReserveDao dao;
	
	@Override
	public int insertReserve(ReserveInfo vo) {
		// TODO Auto-generated method stub
		return dao.insertReserve(vo);
	}

	@Override
	public int updateReserve(ReserveInfo vo) {
		// TODO Auto-generated method stub
		return dao.updateReserve(vo);
	}

	@Override
	public int deleteReserve(int reserve_no) {
		// TODO Auto-generated method stub
		return dao.deleteReserve(reserve_no);
	}

	@Override
	public ReserveInfo selectReserve(int reserve_no) {
		// TODO Auto-generated method stub
		return dao.selectReserve(reserve_no);
	}

	@Override
	public List<ReserveInfo> selectListReserve() {
		// TODO Auto-generated method stub
		return dao.selectListReserve();
	}

	@Override
	public int selectReserveCount() {
		// TODO Auto-generated method stub
		return dao.selectReserveCount();
	}

	@Override
	public CancelReserveInfo selectCancelReserve(int reserve_no) {
		// TODO Auto-generated method stub
		return dao.selectCancelReserve(reserve_no);
	}

}
