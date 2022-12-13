package team.projectA.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.projectA.vo.Criteria;
import team.projectA.vo.ReservVO;
import team.projectA.vo.SearchCriteria;
import team.projectA.vo.UserVO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int changePw(UserVO vo) {
		return sqlsession.update("team.projectA.mapper.MypageMapper.changePw", vo);
	}
	
	  public List<ReservVO> reserv_list()throws Exception{ 
		  return sqlsession.selectList("team.projectA.mapper.MypageMapper.reserv_list"); 
	}
	 public int reserv_count()throws Exception{
		 return sqlsession.selectOne("team.projectA.mapper.MypageMapper.reserv_count");
	 }
	 public List<ReservVO> listPage(HashMap hm)throws Exception{
		 return sqlsession.selectList("team.projectA.mapper.MypageMapper.listPage",hm);
	 }
	 public int reserv_refund(ReservVO rvo){
			return sqlsession.delete("team.projectA.mapper.MypageMapper.reserv_refund", rvo);
		}
	 public ReservVO reservListPop(HashMap hm)throws Exception {
		 return sqlsession.selectOne("team.projectA.mapper.MypageMapper.reservListPop",hm);
	 }
}