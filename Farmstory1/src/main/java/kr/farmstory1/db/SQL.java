package kr.farmstory1.db;

public class SQL {
	//SELECT
	public static final String SELECT_TEMRS = "SELECT * FROM `TERMS`";
	public static final String SELECT_USER="SELECT * FROM `USER` WHERE `UID`=? AND `PASS`=SHA2(?,256)";
	
	//INSERT
	public static final String INSERT_USER="INSERT INTO `USER` SET `UID`=? , `PASS`=SHA2(?,256), `NAME`=?"
											+ ", `NICK`=? , `EMAIL`=?, `HP`=?, `ZIP`=?, `ADDR1`=?, `ADDR2`=?,`REGIP`=?,`REGDATE`=NOW() ";
	
	
}
