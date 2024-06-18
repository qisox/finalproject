package com.kh.dungjip.member.model.vo;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    
    private int userNo;     //  USER_NO
    private String userType;        //  USER_TYPE
    private String userId;//    USER_ID
    private String userPwd;//   USER_PWD
    private String userName;//  USER_NAME
    private String userNickName;//  USER_NICKNAME
    private String age;         //커맨트 객체방식으로 주입받을때 ""이 int에는 들어갈 수 없으니 String 으로 만들어주기
    private String gender;//    GENDER
    private String email;// EMAIL
    private String phone;// PHONE
    private String address;//   ADDRESS
    private String preferLocation;//    PREFER_LOCATION
    private String preferCheck1;//  PREFER_CHECK1
    private String preferCheck2;//  PREFER_CHECK2
    private String preferCheck3;//  PREFER_CHECK3
    private String status;//    STATUS
    private String changeName;			//CHANGE_NAME
    private String originName;  //ORIGIN_NAME
    private String subscribe;
    private Timestamp lastLoginTime;
    private Timestamp lastLogoutTime;
    private boolean active;
    


	   public boolean isActive() {
	        // If both lastLoginTime and lastLogoutTime are null, user has never logged in
	        if (lastLoginTime == null && lastLogoutTime == null) {
	            return false;
	        }

	        // If lastLogoutTime is null but lastLoginTime is not, user is considered active
	        if (lastLogoutTime == null) {
	            return true;
	        }

	        // If lastLoginTime is null, it means user has logged out without any login record (unlikely but possible scenario)
	        if (lastLoginTime == null) {
	            return false;
	        }

	        // User is active if last login time is after the last logout time
	        return lastLoginTime.after(lastLogoutTime);
	    }

	   public String calculateTimeAgo() {
	        LocalDateTime now = LocalDateTime.now();
	        LocalDateTime lastActivityTime;

	        if (lastLogoutTime != null) {
	            lastActivityTime = lastLogoutTime.toLocalDateTime();
	        } else if (lastLoginTime != null) {
	            lastActivityTime = lastLoginTime.toLocalDateTime();
	        } else {
	            return "활동 정보 없음";
	        }

	        long minutesAgo = ChronoUnit.MINUTES.between(lastActivityTime, now);
	        long hoursAgo = ChronoUnit.HOURS.between(lastActivityTime, now);
	        long daysAgo = ChronoUnit.DAYS.between(lastActivityTime, now);

	        if (minutesAgo < 60) {
	            return minutesAgo + "분 전";
	        } else if (hoursAgo < 24) {	
	            return hoursAgo + "시간 전";
	        } else {
	            return daysAgo + "일 전";
	        }	    }
	   
	 
	
	   
		public Member(int userNo, String userType, String userId, String userPwd, String userName, String userNickName,
				String age, String gender, String email, String phone, String address, String status,String originName, String changeName) {
			super();
			this.userNo = userNo;
			this.userType = userType;
			this.userId = userId;
			this.userPwd = userPwd;
			this.userName = userName;
			this.userNickName = userNickName;
			this.age = age;
			this.gender = gender;
			this.email = email;
			this.phone = phone;
			this.address = address;
			this.status = status;
			this.originName = originName;
			this.changeName= changeName;
		}
	    
	   
	   
	
}
