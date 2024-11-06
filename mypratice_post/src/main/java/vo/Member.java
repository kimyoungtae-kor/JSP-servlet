package vo;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String road_addr;
	private String detail_addr;
	private Date regdate;
	
	public Member() {
		
	}

	public Member(String id, String pwd, String name, String email, String road_addr, String detail_addr,
			Date regdate) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.road_addr = road_addr;
		this.detail_addr = detail_addr;
		this.regdate = regdate;
	}
	public static M builder() {
		return new M();
	}
	public static class M{
		String id;
		 String pwd;
		 String name;
		 String email;
		 String road_addr;
		 String detail_addr;
		 Date regdate;
		 public Member build() {
			 return new Member(id,pwd,name,email,road_addr,detail_addr,regdate);
		 }
		 
		 public M id(String id){
			 this.id = id;
			 return this;
		 }
		 public M pw(String pw) {
			 this.pwd = pw;
			 return this;
		 }
		 public M name(String name) {
			 this.name = name;
			 return this;
		 }
		 public M email(String email) {
			 this.email = email;
			 return this;
		 }
		 public M road_addr(String road_addr) {
			 this.road_addr =road_addr;
			 return this;
		 }
		 public M detail_addr(String detail_addr) {
			 this.detail_addr = detail_addr;
			 return this;
		 }
		 public M regdate(Date regdate) {
			 this.regdate = regdate;
			 return this;
		 }
	}


	
	
}
