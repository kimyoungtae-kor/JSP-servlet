package service;

import java.util.List;

import dto.Criteria;
import vo.Reply;

public interface ReplyService {
	int write(Reply reply);
	int modify(Reply reply);
	int remove(Long rno);
	int removeAll(Long pno);
	Reply findBy(Long rno);
	
	List<Reply>  selectList(Long pno);
}