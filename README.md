# Golf
<h2>Index 화면</h2> <br>
![image](https://user-images.githubusercontent.com/102115231/207215581-d437a52f-a2c2-4593-b566-7f99007cf286.png) <br>

<h2>강사조회 화면</h2> <br>
![image](https://user-images.githubusercontent.com/102115231/207217028-0e8476cb-dfd1-405d-b59c-3e74c08b212c.png) <br>
<br>
<b> String sql = "select TEACHER_CODE,TEACHER_NAME,CLASS_NAME,to_char(CLASS_PRICE,'FM990,999')as C,to_char(TEACH_RESIST_DATE,'yyyy\"년\"mm\"월\"dd\"일\')as T from TBL_TEACHAR_202201";
   Connection conn = DBConnect.getConnection();
   PreparedStatement pstmt = conn.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery(); </b> <br>
<br>
   sql에서 테이블 값을 불러와 to_char를 사용해 숫자 앞에 원(￦)표시를 해주면 소수 점이 찍힌다.<br>
   이후, 날짜를 조금씩 불러 연월일을 표시하도록 가져왔습니다. <br>
   
![image](https://user-images.githubusercontent.com/102115231/207219230-15b5647d-739b-4fd3-83f8-d42f9683dac7.png)<br>
while 내에 rs.next()를 통해 마지막까지 반복하고 rs.getString()을 통해 TBL_TEACHAR_202201 테이블에 저장 되어있는 데이터들을 차례대로 가져옵니다. <br>

<h2>수강신청 화면</h2> <br>
![image](https://user-images.githubusercontent.com/102115231/207217342-44a85d77-907e-430c-b65c-207d4de17b69.png) <br>




