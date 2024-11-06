package memberdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.DBconn;
import vo.Member;

public class MemberDao {
	public int insert(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			String sql ="Insert tbl_member(id,pwd,name,email,road_addr,detail_addr) values(?,?,?,?,?,?)";
			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getRoad_addr());
			pstmt.setString(6, member.getDetail_addr());
			
			return pstmt.executeUpdate();
		} catch (ClassNotFoundException |SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException ignore) {}


		}
		return 0;
	}
	public static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao;
	}
	private MemberDao() {}
}
