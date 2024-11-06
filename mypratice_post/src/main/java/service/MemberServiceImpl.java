package service;

import memberdao.MemberDao;
import vo.Member;

public class MemberServiceImpl implements MemberService{
	private MemberDao memberDao = MemberDao.getInstance();
	@Override
	public int register(Member member) {
		return memberDao.insert(member);
	}
	
}
