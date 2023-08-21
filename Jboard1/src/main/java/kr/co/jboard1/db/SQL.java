package kr.co.jboard1.db;

public class SQL {
	
	//user
	
	public static final String INSERT_USER="INSERT INTO `USER` SET `uid`=?, `pass`=SHA2(?,256) , `name`=? ,`nick`=?, `email`=?, `hp`=?, `zip`=?, "
											+ " `addr1`=?, `addr2`=?, `regip`=?, `regDate`=NOW()";
	public static final String SELECT_USER="SELECT * FROM `USER` WHERE UID=? and PASS=SHA2(?,256)";
	public static final String SELECT_USERS="";
	public static final String UPDATE_USER="";
	public static final String DELETE_USER="";
	
	
	public static final String SELECT_COUNT_UID ="SELECT COUNT(*) FROM `User` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICK ="SELECT COUNT(*) FROM `User` WHERE `nick`=?";
	public static final String SELECT_COUNT_EMAIL ="SELECT COUNT(*) FROM `User` WHERE `email`=?";
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
