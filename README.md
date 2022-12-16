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

수강신청 화면  <br>
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
스위치 문을 통해 입력받은 value값의 맞는 값을 출력해주고 회원번호의 첫번째 번호가 2인 경우에는 수강료가 절반 나누어져 츨력됩니다. <br>

<b align = "center>수강신청 데이터 입력하기 </b> <br>
![image](https://user-images.githubusercontent.com/102115231/208013039-aa14bacd-c728-48e8-bfa0-626f8cc9104c.png) <br>
request.setCharacterEncoding를 UTF-8로 지정해주어 데이터의 값이 정상적으로 보이도록 하고, sql문의 insert문을 통해 테이블의 값을 넣을 수 있도록 합니다. <br>
![image](https://user-images.githubusercontent.com/102115231/208013647-f1979a0f-367d-4ed0-bc37-8dce0b4a91aa.png) <br>
DB 연결 후, 테이블 컬럼 순서를 맞추어준 후, 페이지의 name 값을 컬럼명과 같도록 입력하여 데이터를 ?로 넣어주며 업데이트가 가능하게 해줍니다. <br>

<b>회원정보조회</b> <br>
회원정보조회 화면
![image](https://user-images.githubusercontent.com/102115231/208014061-5386f23d-1e85-4fe9-b16f-e7c5c99e3e37.png) <br>
<br>
<br>
<b>String sql = "select substr(c.resist_month,1,4) || '년' || substr(c.resist_month,5,2) || '월' resist_month, c.c_no, m.c_name, t.class_name, c.class_area, to_char(c.tuition, 'L999,999') tuition, m.grade <br>
from TBL_CLASS_202201 c, TBL_MEMBER_202201 m, TBL_TEACHER_202201 t <br>
where c.c_no = m.c_no and c.teacher_code = t.teacher_code"; </b>
</br>
</br>

sql문에서 먼저 각 테이블 당 이름을 정하고, 테이블의 기본 키를 조인시켜줍니다. <br>
class테이블 자체를 기본으로해서 member테이블과 회원번호를 묶어줍니다. 이후, 묶은 테이블을 통해 출력에 필요한 값을 조건에 맞는 데이터를 가져와 출력합니다. <br>

<b>강사매출현황</b> </br>
강사매출현황 화면 <br>
<br>
<br>
![image](https://user-images.githubusercontent.com/102115231/208015259-c4fb99f9-3568-46c2-bcad-4a4da904d8e4.png)<br>
<br>
 <b>String sql = "select T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME, to_char(sum(C.TUITION), 'L999,999')TUITION <br>
 from TBL_TEACHER_202201 T,TBL_CLASS_202201 C <br>
 where T.TEACHER_CODE=C.TEACHER_CODE group by T.TEACHER_CODE,T.CLASS_NAME,T.TEACHER_NAME,C.TUITION order by T.TEACHER_CODE"; </b>
<br>
<br>
sql문은 teacher 테이블과 class테이블 두 개를 사용하기에 두 테이블을 불러와서 명칭을 만들어 줍니다. 그리고 강사코드를 사용해서 조인합니다. <br>
테이블의 불러올 강사코드, 강의명, 강사명을 하나하나 불러와서 마지막 총 매출 값은 sum을 통해 더해준 후 ￦와 , 를 넣어줍니다. <br>
group by는 중복된 내용을 하나로 묶어주는 것이기에 총 매출을 구하기 위해 사용됩니다. <br>
마지막으로 강사코드를 오름차순으로 정렬해줍니다. <br>


