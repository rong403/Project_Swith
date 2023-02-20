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
		return dao.insertReserve(vo);
	}

	@Override
	public int updateReserve(ReserveInfo vo) {
		return dao.updateReserve(vo);
	}

	@Override
	public int deleteReserve(String member_id, String reserve_no) {
		return dao.deleteReserve(member_id, reserve_no);
	}

	@Override
	public ReserveInfo selectReserve(String member_id, String reserve_no) {
		return dao.selectReserve(member_id, reserve_no);
	}

	@Override
	public List<ReserveInfo> selectListReserve() {
		return dao.selectListReserve();
	}

	@Override
	public int selectReserveCount() {
		return dao.selectReserveCount();
	}

	@Override
	public CancelReserveInfo selectCancelReserve(String member_id, String reserve_no) {
		return dao.selectCancelReserve(member_id, reserve_no);
	}

	@Override
	public List<ReserveInfo> selectListMyReserve(String member_id) {
		return dao.selectListMyReserve(member_id);
	}

	@Override
	public int insertCancelReserve(ReserveInfo vo) {
		return dao.insertCancelReserve(vo);
	}

	@Override
	public int deleteCancelReserve(String member_id, String reserve_no) {
		return 0;
	}

	@Override
	public List<CancelReserveInfo> selectListCancelReserve() {
		return null;
	}

}
