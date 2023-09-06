package kr.farmstory2.db;

public class SQL {
	//SELECT

	public static final String SELECT_TEMRS = "SELECT * FROM `Terms`";
	public static final String SELECT_USER="SELECT * FROM `User` WHERE `UID`=? AND `PASS`=SHA2(?,256)";
	
	public static final String SELECT_ARTICLES="SELECT * FROM `Article` AS a "
												+ "INNER JOIN `User` AS b"
												+ " ON a.writer=b.uid"
												+ "	WHERE useyn ='Y' and cate =? "
												+ " order by `no` DESC"
												+ " limit ? ,10";
											
	public static final String SELECT_COUNT_TOTAL= "SELECT COUNT(*) FROM `Article` WHERE cate=? AND useyn='Y'";
	
	public static final String SELECT_COUNT_UID="SELECT COUNT(*) FROM `User` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICK="SELECT COUNT(*) FROM `User` WHERE `nick`=?";
	public static final String SELECT_COUNT_HP="SELECT COUNT(*) FROM `User` WHERE `hp`=?";
	public static final String SELECT_COUNT_EMAIL="SELECT COUNT(*) FROM `User` WHERE `email`=?";
	
	public static final String SELECT_COUNT_ORDER= "SELECT COUNT(*) FROM `Order` WHERE `USEYN`='Y'";
	public static final String SELECT_ORDER= "SELECT * FROM `Order` WHERE `orderno`=?";
	
	public static final String SELECT_VIEW="SELECT `TITLE`,`CONTENT`,`no`,`file` FROM `Article` WHERE `NO`=? ";
	
	public static final String SELECT_COMMENTS="SELECT * FROM `Article` as a\r\n"
			+ "inner JOIN `User` as b\r\n"
			+ "ON a.writer = b.uid\r\n"
			+ " where `parent`=? and `useyn`=''";;
	
	public static final String SELECT_NEW_ARTICLE="SELECT `no`,`title`,`rdate` FROM `Article` where `cate`=? order by `no` DESC LIMIT ?";
	
	public static final String SELECT_PRODUCTS_ALL="SELECT * FROM `Product` WHERE `stock` >0  "
													+ "limit ? ,10";
	public static final String SELECT_PRODUCT="SELECT * FROM `Product` WHERE `pno`=? ";
			
	public static final String SELECT_PRODUCTS_TYPE="SELECT * FROM `Product` WHERE `stock` >0 and `type`=?"
													+ "limit ? ,10";
	
	public static final String SELECT_COUNT_PRODUCT_TOTAL="SELECT COUNT(*) FROM `Product` where `stock`>0";
	public static final String SELECT_COUNT_PRODUCTS_TYPE="SELECT COUNT(*) FROM `Product` where `stock`>0 AND `type`=?";
	public static final String SELECT_COUNT_PRODUCTS_ALL="SELECT COUNT(*) FROM `Product` where `stock`>0";
	
	public static final String SELECT_ORDERS = "SELECT a.*,b.pName ,b.thumb1  from `Order` as a \r\n"
												+ "join `Product` as b on a.orderproduct =b.pno"
												+ " WHERE a.USEYN='Y'"
												+ " order by `orderno` DESC"
												+ " limit ? ,10";
	
	//INSERT
	public static final String INSERT_USER="INSERT INTO `User` SET `uid`=? , `pass`=SHA2(?,256), `name`=?"
											+ ", `nick`=? , `email`=?, `hp`=?, `zip`=?, `addr1`=?, `addr2`=?,`regip`=?,`regdate`=NOW() ";
	public static final String INSERT_ARTICLE="INSERT INTO `Article` SET `cate`=?, `title`=?,`content`=?,`writer`=?,`file`=?,`regip`=?,`rdate`=NOW(),`useyn`='Y'";

	public static final String INSERT_COMMENT="INSERT INTO `Article` SET `PARENT`=?, "
			+ "`CONTENT`=?, `WRITER`=?, `REGIP`=? , `RDATE`=NOW(), `USEYN`=''";
	
	public static final String INSERT_PRODUCT ="INSERT INTO `Product` set `type`=?, `pName`=?, `price`=?, `delivery`=?, `stock`=?"
												+ " , `thumb1`=? ,`thumb2`=?, `thumb3`=?, `seller`=? , `etc`=? , `rdate`=NOW()";
	
	public static final String INSERT_ORDER ="INSERT INTO `Order` SET `orderproduct`=? ,`ordercount`=?,`orderdelivery`=?,`orderprice`=?,`ordertotal`=?,"
											+ "`orderhp`=?,`orderzip`=?,`orderaddr1`=?,`orderaddr2`=?,"
											+ "`orderetc`=?,"
											+ "`orderuser`=?,"
											+ "`orderreceiver`=?,"
											+ "`orderdate`=NOW()";
	
	//UPDATE
	public static final String UPDATE_ARTICLE="UPDATE `Article` SET `title`=?, content=? where `no`=?";
	public static final String UPDATE_USEYN_COMMENT="UPDATE `Article` SET `useyn`='N' WHERE `no`=?";

	public static final String UPDATE_USEYN_ORDER="UPDATE `Order` SET `useyn`='N' WHERE `orderno`=?";
	
	public static final String UPDATE_COMMENT ="UPDATE `Article` SET `content`=? where `no`=?";
	
	public static final String UPDATE_VIEW_HIT="UPDATE `Article` SET `hit`=`hit`+1 where `no`=?";
	public static final String UPDATE_COMMENT_NUM="UPDATE `Article` SET `comment`= (SELECT COUNT(*) FROM ( SELECT * FROM `Article` WHERE `PARENT`=? and USEYN='') tmp_1) where `no`=?";
	
	//DELETE
	public static final String DELETE_ARTICLE="UPDATE `Article` set `useyn`='N' WHERE `no`=?";
	
	//new
	public static final String SELECT_MAX_NO="SELECT MAX(`no`) FROM `Article`";
	//FIEL
	public static final String INSERT_FILE="INSERT INTO `File` SET "
			+ "`ano`=?,"
			+ "`oriName`=?,"
			+ "`newName`=?,"
			+ "`rdate`=NOW()";
public static final String SELECT_FILE ="SELECT `oriName`,`newName`,`download` FROM `File` WHERE ano=? ";
public static final String SELECT_FILE2 ="SELECT `oriName`,`newName`,`download` FROM `File` WHERE fno=? ";
public static final String DELETE_FILE = "DELETE FROM `File` WHERE `ano`=?";	
	
public static final String UPDATE_COUNT_FILE="UPDATE `Article` SET `file`=`file`-1 where `no`=?";
	
}
