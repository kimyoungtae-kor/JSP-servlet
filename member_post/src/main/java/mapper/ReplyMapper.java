package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Criteria;
import dto.ReplyCri;
import vo.Post;
import vo.Reply;

public interface ReplyMapper {
	int insert(Reply reply);
	int update(Reply reply);
	int delete(Long rno);
	int deleteAll(Long pno);
	
	
	Reply selectOne(Long rno);
	List<Reply> selectList(@Param("pno") Long pno, @Param("cri") ReplyCri cri);
	List<Reply> selectListByMe(Reply reply);
}
