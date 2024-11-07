package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DBconn;
import vo.Member;
import vo.Post;

public class PostDao {
	//CRUD
   public int insert(Post post) {
	   Connection conn = null;
       PreparedStatement pstmt = null;
       try {
           String sql = "insert into tbl_post (title, writer, content) values(?,?,?)";
          conn = DBconn.getConnection();

           pstmt = conn.prepareStatement(sql);

           int idx = 1;
           pstmt.setString(idx++, post.getTitle());
           pstmt.setString(idx++, post.getWriter());
           pstmt.setString(idx++, post.getContent());
           // 3. 문장 실행
//           return stmt.executeUpdate(sql);
           return pstmt.executeUpdate();

       } catch (SQLException | ClassNotFoundException e) {
           e.printStackTrace();
       } finally {
           try {
               pstmt.close();
               conn.close();
           } catch (SQLException ignore) {}
       }

       return 0;
   }
   public Post selectOne(Long pno) {
	   Post post = null;
		String sql = "SELECT pno,title,writer,content,view_count,regdate,updatedate FROM tbl_post where pno = ?";
		
		try(Connection conn = DBconn.getConnection();PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setLong(1,pno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int idx = 1;
				post = Post.builder()
						.pno(rs.getLong(idx++))
						.title(rs.getString(idx++))
						.writer(rs.getString(idx++))
						.content(rs.getString(idx++))
						.viewCount(rs.getLong(idx++))
						.regdate(rs.getDate(idx++))
						.updatedate(rs.getDate(idx++))
						.build();
			}
			rs.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return post;
   }
   public List<Post> selectList() {
	   List<Post> posts = new ArrayList<>();
		String sql = "SELECT pno,title,writer,view_count,regdate FROM tbl_post Order by pno DESC";
		
		try(Connection conn = DBconn.getConnection();PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int idx = 1;
				Post post = Post.builder()
						.pno(rs.getLong(idx++))
						.title(rs.getString(idx++))
						.writer(rs.getString(idx++))
						.viewCount(rs.getLong(idx++))
						.regdate(rs.getDate(idx++))
						.build();
				posts.add(post);
			}
			rs.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return posts;
   }
   public int update(Post post) {
	   Connection conn = null;
       PreparedStatement pstmt = null;
       try {
    	   String sql = "update tbl_post set title = ?, content = ?, updatedate = now() where pno = ?";
          conn = DBconn.getConnection();

           pstmt = conn.prepareStatement(sql);

           int idx = 1;
           pstmt.setString(idx++, post.getTitle());
           pstmt.setString(idx++, post.getContent());
           pstmt.setLong(idx, post.getPno());
           // 3. 문장 실행
//           return stmt.executeUpdate(sql);
           return pstmt.executeUpdate(); 

       } catch (SQLException | ClassNotFoundException e) {
           e.printStackTrace();
       } finally {
           try {
               pstmt.close();
               conn.close();
           } catch (SQLException ignore) {}
       }

       return 0;
   }
   public int delete(Long pno) {
	   Connection conn = null;
       PreparedStatement pstmt = null;
       try {

           String sql = "delete from tbl_post where pno =?";
           conn = DBconn.getConnection();
           pstmt = conn.prepareStatement(sql);

           pstmt.setLong(1, pno);
           return pstmt.executeUpdate();

       } catch (SQLException | ClassNotFoundException e) {
           e.printStackTrace();
       } finally {
           try {
               pstmt.close();
               conn.close();
           } catch (SQLException ignore) {}
       }

       return 0;
   }
//   private static PostDao dao = new PostDao();
//
//	public static PostDao getInstance() {
//		
//		return dao;
//	}
    public static void main(String[] args) {
        PostDao dao = new PostDao();
//        반복생성
//        for(int i = 0;i <10; i++) {
//        	dao.insert(Post.builder().writer("dydxo4423").title("제목 + " + (i + 1)).content("내용").build());
//        }
////        
////      리스트 호출
//        dao.selectList().forEach(System.out::println); 
////        단일 조회
//        System.out.println(dao.selectOne(4L));
////        삭제
//        System.out.println(dao.delete(4L));
////        수정
//        Post post = dao.selectOne(6L);
//        System.out.println(post);
//        post = Post.builder().pno(post.getPno()).title("수정된 제목").content("수정된 내용").build();
//        
//        dao.update(post);
//        
//        System.out.println(post);
//        Post result2 = dao.selectOne(6L);
//        result2 = Post.builder().title("헤헷").content("헤헤헿").pno(post.getPno()).build();
//        
//       int resultupdate2 = dao.update(result2);
//       System.out.println(resultupdate2);
    }
}
