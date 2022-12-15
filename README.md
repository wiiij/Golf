# Golf
Index 화면 <br>
![image](https://user-images.githubusercontent.com/102115231/207215581-d437a52f-a2c2-4593-b566-7f99007cf286.png) <br>

강사조회 화면 <br>
![image](https://user-images.githubusercontent.com/102115231/207217028-0e8476cb-dfd1-405d-b59c-3e74c08b212c.png) <br>
<br>
<b> String sql = "select TEACHER_CODE,TEACHER_NAME,CLASS_NAME,to_char(CLASS_PRICE,'FM990,999')as C,to_char(TEACH_RESIST_DATE,'yyyy\"년\"mm\"월\"dd\"일\')as T from TBL_TEACHAR_202201";
   Connection conn = DBConnect.getConnection();
   PreparedStatement pstmt = conn.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery(); </b> <br>
<br>
   sql에서 테이블 값을 불러와 to_char를 사용해 숫자 앞에 원(￦)표시를 해주면 소수 점이 찍힙니다.<br>
   이후, 날짜를 조금씩 불러 연월일을 표시하도록 가져왔습니다. <br>
   
![image](https://user-images.githubusercontent.com/102115231/207219230-15b5647d-739b-4fd3-83f8-d42f9683dac7.png)<br>
while 내에 rs.next()를 통해 마지막까지 반복하고 rs.getString()을 통해 TBL_TEACHAR_202201 테이블에 저장 되어있는 데이터들을 차례대로 가져옵니다. <br>

<b>수강신청 화면 </b> <br>
![image](https://user-images.githubusercontent.com/102115231/207217342-44a85d77-907e-430c-b65c-207d4de17b69.png) <br>

<b>유효성 검사 </b> <br>
![image](https://user-images.githubusercontent.com/102115231/207495902-8fb36295-e473-4368-a68f-4a0eff446ac4.png) <br>
만약 값이 누락되거나 잘못된 값이 입력이 되었다면 경고창이 뜨며 포커스가 설정됩니다. <br>
![image](https://user-images.githubusercontent.com/102115231/207496594-d55ffe82-b1d7-4cca-83ab-c911933c7241.png)<br>

<b>회원명&강의명 </b> <br>
![image](https://user-images.githubusercontent.com/102115231/207498672-da0db45a-3366-4916-8164-90aad3568282.png) <br>
강의명은 강의 신청할 반을 선택하게되면 그의 맞는 수강료를 출력합니다. <br>
![image](https://user-images.githubusercontent.com/102115231/207497892-69b257ca-b79b-4c8c-ada2-d8e768704137.png) <br>
value값을 받고 받은 값을 회원번호 값에 삽입하여 회원이름과 회원번호가 맞게 출력합니다. 이후, 아래 강의신청과 수강료가 초기화가 됩니다.<br>
![image](https://user-images.githubusercontent.com/102115231/207498920-4ad3fcdd-a89f-4b99-a5f2-d829675f10f4.png) <br>
그리고 회원 번호가 200000을 넘게되면 수강료가 할인 되었다는 메세지가 나옵니다. <br>
![image](https://user-images.githubusercontent.com/102115231/207498997-b87cca32-9c92-409a-ad93-60869252a2a7.png) <br>
스위치 문을 통해 입력받은 value값의 맞는 값을 출력해주고 회원번호의 첫번째 번호가 2인 경우에는 수강료가 2나누어져 츨력됩니다. <br>






