package kr.co.jboard2.db;

public class SQL {
	
	//user
	
	public static final String INSERT_USER="INSERT INTO `User` SET `uid`=?, `pass`=SHA2(?,256) , `name`=? ,`nick`=?, `email`=?, `hp`=?, `zip`=?, "
											+ " `addr1`=?, `addr2`=?, `regip`=?, `regDate`=NOW()";
	public static final String SELECT_USER="SELECT * FROM `User` WHERE UID=? and PASS=SHA2(?,256)";
	public static final String SELECT_USER_NAME_EMAIL="SELECT * FROM `User` WHERE `name`=? and `email`=?";
	public static final String SELECT_USER_UID_EMAIL="SELECT * FROM `User` WHERE `uid`=? and `email`=?";
	public static final String SELECT_USERS="";
	public static final String UPDATE_USER="";
	public static final String UPDATE_USER_PASS="UPDATE `User` SET `pass`=SHA2(?,256) where `uid`=?";
	public static final String UPDATA_USER="UPDATE `User` SET "
													+ "	`name`=?,"
													+ "	`nick`=?,"
													+ "	`email`=?,"
													+ "	`hp`=?,"
													+ "	`zip`=?,"
													+ "	`addr1`=?,"
													+ "	`addr2`=?"
													+ "	WHERE `UID`=?";

	public static final String UPDATE_USER_FOR_WITHRAW="UPDATE `User` SET "
														+ "	`pass`=null,"
														+ "	`name`=null,"
														+ "	`nick`=null,"
														+ "	`email`=null,"
														+ "	`hp`=null,"
														+ "	`role`=null,"
														+ "	`zip`=null,"
														+ "	`addr1`=null,"
														+ "	`addr2`=null,"
														+ "	`leaveDate`=NOW()"
														+ "	WHERE `UID`=?";
	
	
	
	public static final String SELECT_COUNT_UID ="SELECT COUNT(*) FROM `User` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICK ="SELECT COUNT(*) FROM `User` WHERE `nick`=?";
	public static final String SELECT_COUNT_EMAIL ="SELECT COUNT(*) FROM `User` WHERE `email`=?";
	public static final String SELECT_COUNT_EMAIL_AND_NAME ="SELECT COUNT(*) FROM `User` WHERE `email`=? and `name`=?";
	public static final String SELECT_COUNT_EMAIL_AND_UID ="SELECT COUNT(*) FROM `User` WHERE `email`=? and `uid`=?";
	public static final String SELECT_COUNT_HP ="SELECT COUNT(*) FROM `User` WHERE `HP` = ?";
	public static final String SELECT_TERMS ="SELECT * FROM `Terms`";
	
	//list
	public static final String SELECT_COUNT_TOTAL = "select count(*) from article";
	
	//VIEW
	public static final String SELECT_VIEW ="SELECT `TITLE`,`CONTENT` FROM article WHERE NO=? ";
	public static final String UPDATE_VIEW ="UPDATE `ARTICLE` SET USEYN='N' WHERE NO=?";
	
	
	// write
	public static final String INSERT_ARTICLE ="INSERT INTO `ARTICLE` SET `TITLE`=?, "
												+ "`CONTENT`=?, `WRITER`=?, `REGIP`=? , `RDATE`=NOW()";
	
	public static final String SELECT_ARTICLES="SELECT * FROM `article` as a\r\n"
			+ "inner JOIN `user` as b\r\n"
			+ "ON a.writer = b.uid"
			+ " WHERE USEYN='Y'"
			+ " order by `no` DESC"
			+ " limit ?,10";//inner join 해둬야 아까작성해뒀던 DAO파일에서 순번 안꼬임;


}									// a.* b.`nick` 로 특정컬럼들만 조회하는게 보여주는게 더빠르겠지만 
									//나중에 user테이블에서 nick만 끌고오는게 아닐수도있기때문에 이렇게 쿼리작성
