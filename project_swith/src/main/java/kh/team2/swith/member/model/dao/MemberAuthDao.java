package kh.team2.swith.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.team2.swith.member.model.vo.CustomMemberDetails;

@Repository
public class MemberAuthDao {
	@Autowired
    private SqlSessionTemplate sqlSession;
 
    public CustomMemberDetails getUserById(String username) {
        return sqlSession.selectOne("member.selectUserById", username);
    }
    public void updateFailureCount(String username) {
		sqlSession.update("member.updateFailureCount", username);
	}
	
	public int checkFailureCount(String username) {
		return sqlSession.selectOne("member.checkFailureCount", username);
	}
	
	public void updateDisabled(String username) {
		sqlSession.update("member.updateUnenabled", username);
	}

	public void updateFailureCountReset(String username) {
		sqlSession.update("member.updateFailureCountReset", username);
	}
}
