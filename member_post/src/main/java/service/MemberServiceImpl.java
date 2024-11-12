package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.MemberDao;
import mapper.MemberMapper;
import mapper.PostMapper;
import utils.MybatisInit;
import vo.Member;
import vo.Post;

public class MemberServiceImpl implements MemberService{
	private MemberDao memberDao = MemberDao.getInstance();
	@Override
	public int register(Member member) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.insert(member);
		}
	}

	@Override
	public Member findBy(String id) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession()){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.selectOne(id);
		}
	}
	@Override
	public boolean login(String id, String pw) {
		Member m = findBy(id);
		return m != null && m.getPwd().equals(pw);
	}
	
	@Override
	public boolean logout(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Member> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(Member member) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
