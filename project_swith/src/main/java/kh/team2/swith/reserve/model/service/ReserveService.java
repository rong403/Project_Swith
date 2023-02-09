package kh.team2.swith.reserve.model.service;

import java.util.List;

import kh.team2.swith.reserve.model.vo.CancelReserveInfo;
import kh.team2.swith.reserve.model.vo.ReserveInfo;

public interface ReserveService {
	public int insertReserve(ReserveInfo vo);
	public int updateReserve(ReserveInfo vo);
	public int deleteReserve(int reserve_no);
	public ReserveInfo selectReserve(int reserve_no);
	public List<ReserveInfo> selectListReserve();
	public int selectReserveCount();
	public CancelReserveInfo selectCancelReserve(int reserve_no);
}
