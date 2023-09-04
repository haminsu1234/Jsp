<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

        <div id="user">
           <section class="login">
                <form action="/Farmstory2/user/login.do" method="post">
                	<input type ="hidden" name="target" value=""/>
                	<input type ="hidden" name="group" value=""/>
                	<input type ="hidden" name="cate" value=""/>
                	<input type ="hidden" name="no" value=""/>
                    <table border="0">
                        <tr>
                            <td><img src="/Farmstory2/images/login_ico_id.png" alt="아이디"></td>
                            <td><input type="text" name="uid" placeholder="아이디 입력"></td>
                        </tr>
                        <tr>
                            <td><img src="/Farmstory2/images/login_ico_pw.png" alt="비밀번호"></td>
                            <td>
                            	<input type="password" name="pass" onkeyup="checkCapsLock(event)" placeholder="비밀번호 입력">
                            	<div id="pass"></div><!-- caps lock on/off 문구출력 -->
                            </td>
                            
                        </tr>
                    </table>
                    <input type="submit" value="로그인" class="btnLogin">
                </form>
                <div>
                    <h3>회원 로그인 안내</h3>
                    <p>
                        아직 회원이 아니시면 회원으로 가입하세요.
                    </p>
                    <a href="/Farmstory2/user/terms.do">회원가입</a>
                </div>
            </section>
        </div>
<%@ include file="./_footer.jsp" %>