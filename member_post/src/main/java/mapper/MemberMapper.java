package mapper;

import vo.Member;

public interface MemberMapper {
	 public int insert(Member member);
	 
	 public Member selectOne(String id);
	 
}
