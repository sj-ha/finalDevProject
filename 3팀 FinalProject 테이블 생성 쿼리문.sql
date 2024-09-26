sqlplus system/System1234

show user;

create user final_admin identified by final_admin;
grant all privileges to final_admin;

conn final_admin/final_admin;

-- 유저 입력

insert into users (address_basic, address_detail, gender, id, user_image, name, password, phone_num, role, zipcode, code) values ('남양주', '중랑구', '남성', 'test', '1.png', '이재학', 'test', '010-1234-1234', '0', '0', user_seq.nextval);
insert into users (address_basic, address_detail, gender, id, user_image, name, password, phone_num, role,zipcode, code) values ('서울', '금천구', '여성', 'test2',  '2.png', '김보희', 'test2', '010-1234-1234', '0', '0', user_seq.nextval);
insert into users (address_basic, address_detail, gender, id, user_image, name, password, phone_num, role,zipcode, code) values ('인천', '계양구', '남성', 'test3',  '3.png', '김봉진', 'test3', '010-1234-1234', '0', '0', user_seq.nextval);
insert into users (address_basic, address_detail, gender, id, user_image, name, password, phone_num, role,zipcode, code) values ('대전', '중구', '여성', 'test4',  '4.png', '하수진', 'test4', '010-1234-1234', '0', '0', user_seq.nextval);
insert into users (address_basic, address_detail, gender, id, user_image, name, password, phone_num, role,zipcode, code) values ('부산', '남구', '남성', 'test5',  '5.png', '서강민', 'test5', '010-1234-1234', '0', '0', user_seq.nextval);
insert into users (address_basic, address_detail, gender, id, user_image, name, password, phone_num, role,zipcode, code) values ('노량진', '동구', '여성', 'test6',  '6.png', '김하현', 'test6', '010-1234-1234', '0', '0', user_seq.nextval);
insert into users (address_basic, address_detail, gender, id, user_image, name, password, phone_num, role,zipcode, code) values ('테스트', '테스트', '남성', 'test7', '7.png', '테스트', 'test7', '010-1234-1234', '9', '0', user_seq.nextval);

-- 관리자 권한 부여

update users set role = 9 where id = 'test';

commit;


drop table admin;
create table ADMIN(
  admin_number number(10) not null,
  admin_writer varchar2(50) not null,
  admin_title varchar2(100) not null,
  admin_date DATE default sysdate,
  admin_content varchar2(1000) not null,
  admin_image varchar2(100),
constraint pk_admin_number primary key(admin_number));
drop sequence admin_num;
CREATE SEQUENCE ADMIN_NUM INCREMENT BY 1 START WITH 0 maxvalue 999999 minvalue 0;
commit;


drop table MP_FILE;
CREATE TABLE MP_FILE
(
    FILE_NO NUMBER,                         --파일 번호
    ADMIN_NUMBER NUMBER(10) NOT NULL,                    --게시판 번호
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --원본 파일 이름
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --변경된 파일 이름
    FILE_SIZE NUMBER,                       --파일 크기
    REGDATE DATE DEFAULT SYSDATE NOT NULL,  --파일등록일
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--삭제구분
    PRIMARY KEY(FILE_NO)                    --기본키 FILE_NO
);
COMMIT;

drop sequence SEQ_MP_FILE_NO;
CREATE SEQUENCE SEQ_MP_FILE_NO START WITH 0 INCREMENT BY 1 NOMAXVALUE NOCACHE minvalue 0;
COMMIT;

insert into admin VALUES (admin_num.nextval, '관리자_김하현', '위트래블 투어패스 오픈 이벤트', '2021-11-11', '위트래블 쿠폰 오픈 기념 이벤트를 실시하고자 합니다.<br>가고 싶었던 관광지나 소개해준 싶은 관광지를 사연과 함께 작성하여 주시면 됩니다.<br>감사합니다.', 1);
insert into admin VALUES (admin_num.nextval, '관리자_이재학', '11월 시스템 정기점검 안내', '2021-11-16', '위트래블 투어를 이용해주시는 고객님께 감사드립니다.<br>보다 안정적인 서비스를 제공하기 위해 11월 시스템 정기점검을 실시합니다.<br><br>작업 시간 : 11월 23일(수) 03:00 ~ 06:00(3시간)', 1);
insert into admin VALUES (admin_num.nextval, '관리자_김봉진', '여행지 베스트 샷 올리기 이벤트', '2021-11-19', '안녕하세요. 위트래블입니다.<br>여행지에서 여행 동행자와 직접 찍은 베스트샷을 올려주세요.<br>채택되신 분에게는 소정의 상품을 드립니다.<br><br>기간: 11월 22일(월) ~ 11월 26일(금)<br>방법: 자유게시판에 글 작성.<br><br>당첨발표일: 11월 29일(월), 공지사항 및 메일 안내 예정', 1);
insert into admin VALUES (admin_num.nextval, '관리자_하수진', '충청 투어패스 시설사 할인 중단 공지', '2021-11-25', '안녕하세요. 위트래블입니다.<br>충청 투어패스 참여 시설사 중 내부 사정에 따라 할인이 종료된 곳을 아래와 같이 안내드리오니 이용에 불편 없으시도록 참고해 주시기 바랍니다.<br><br>할인 종료 시설<br>1. 만천하스카이워크<br>2.청풍호반 케이블카<br><br>이후로도 신규 관광지와 다양한 혜택으로 즐거운 여행의 길잡이가 되겠습니다.<br>감사합니다.', 1);
insert into admin VALUES (admin_num.nextval, '관리자_김보희', '여행지 베스트 샷 올리기 이벤트 당첨자 발표','2021-11-29', '여행지 베스트 샷 올리기 이벤트에 참여해주신 모든 분께 감사드립니다.<br>많은 분의 참여 속에서 이벤트 당첨자를 채택했습니다.<br>당첨자 분에게는 메일을 남겨드렸으니 확인해주시길 바랍니다.<br>감사합니다.', 1);
insert into admin VALUES (admin_num.nextval, '관리자_서강민', '코로나19 관련 영남 투어패스 휴관 시설 공지','2021-11-30', '안녕하세요. 위트래블입니다.<br>코로나19로 인한 휴관중인 자유이용시설 업체를 공지해드립니다.<br>아래 시설들을 확인하시어 여행에 지장 없도록 일정 체크 바랍니다.<br><br>[영남투어패스 휴관 시설 및 기간]<br>1. 경주 동궁원, 기간 미정<br>2. 포항 로보라이프뮤지엄, 기간 미정<br>3. 영덕 정크트릭아트전시관, 12월 24일 ~ 1월 3일<br><br>감사합니다.', 1);
insert into admin VALUES (admin_num.nextval, '관리자_김하현', '오미크론 변이 관련 격리 조건 변경 공지', '2021-12-01', '안녕하세요. 위트래블입니다.<br>최근 발생된 코로나19 오미크론 변이 바이러스로 인해 국내 격리 조건이 변경되었습니다.<br>해당 변이 바이러스 국내 유입 방지를 위한 정부 제한 조치 안내 드립니다.<br><br>[주요 내용]<br>1. 예방접종완료자 격리면제 제외국가 발 입국자는 예방접종여부와 관계없이 격리면제 적용 제외<br>2. 해외 예방접종완료 격리면제서 소지자, 해외 예방접종완료자 확인서를 소지한 해외 예방접종완료자도 격리면제 제외<br>3. 예방접종완료자 격리면제 제외국가 : 모든 국가/지역<br> 4. 적용기간: 2021년 12월 03일 ~ 2021년 12월 16일 입국자<br><br>위트래블은 안전한 고객님의 여행을 위해 항상 최선을 다하고 있으며, 추가 지침 발생 및 변경 시 별도 공지 안내 드리겠습니다.<br>감사합니다.', 1);
insert into admin VALUES (admin_num.nextval, '관리자_이재학', '12월 시스템 정기점검 안내', '2021-12-03', '위트래블 투어를 이용해주시는 고객님께 감사드립니다.<br>보다 안정적인 서비스를 제공하기 위해 12월 시스템 정기점검을 실시합니다.<br><br>작업 시간 : 12월 10일(금) 03:00 ~ 06:00(3시간)', 1);
insert into admin VALUES (admin_num.nextval, '관리자_김보희', 'NH농협카드 결제서비스 일시중단 안내', '2021-12-04', '안녕하세요. 위트래블입니다.<br>NH농협카드 전산 시스템 개편에 따른 온라인 결제서비스가 일시 중단될 예정입니다. <br><br>작업 시간 : 12월 13일(월) 21:00 ~ 06:00(9시간)<br>사유 : 전산 시스템 개편 적용에 따른 온라인(인터넷/모바일 결제) 일시 중단<br><br>감사합니다.', 1);
insert into admin VALUES (admin_num.nextval, '관리자_하수진', 'KB카드 결제서비스 일시중단 안내', '2021-12-05', '안녕하세요. 위트래블입니다.<br>KB국민카드 차세대시스템 이행에 다른 온라인 결제서비스가 일시 중단될 예정입니다. <br><br>작업 시간 : 12월 14일(화) 21:00 ~ 06:00(9시간)<br>사유 : KB국민카드 차세대시스템 적용에 따른 앱카드/ISP/제휴간편결제 일시중단<br><br>감사합니다.', 1);
insert into admin VALUES (admin_num.nextval, '관리자_서강민', '(카카오페이) BC카드 시스템 작업으로 인한 서비스 이용 제한 안내', '2021-12-06', '안녕하세요. 위트래블입니다.<br>BC카드 시스템 점검으로 인하여, 카카오페이-BC카드 서비스 이용이 일시적으로 중단될 예정입니다. <br><br>작업 시간 : 12월 14일(화) 21:00 ~ 06:00(9시간)<br>사유 : 네트워크 장비 작업<br><br>감사합니다.', 1);
insert into admin VALUES (admin_num.nextval, '관리자_김봉진', '개인정보 처리방침 개정관련 사전안내', '2021-12-07', '안녕하세요. 위트래블입니다.<br>개인정보처리방침이 다음과 같이 일괄 최신화 되어 안내드립니다. <br><br>1. 변경사항<br>(1) 회원가입 시점에 수집하는 개인정보 항목 현황을 반영하였으며, 프로필 정보 설정과 관련한 안내를 추가하였습니다.<br>(2)개인정보 수탁업체를 현행화하였습니다.<br><br>2. 변경일자<br>변경된 ‘개인정보 처리방침’은 2022년 01월 01일자로 효력이 발생됩니다.<br><br>3. 이의제기 및 문의<br>변경된 ‘개인정보 처리방침’ 내용에 대한 문의사항이 있으신 경우, 위트래블 고객센터로 접수해 주시면 신속하고 친절하게 안내해드리겠습니다.<br><br>위트래블은 앞으로도 회원님의 개인정보를 보다 안전하게 보호할 것을 약속드리며, 더욱 신뢰받는 서비스로 보답하겠습니다.<br>감사합니다.', 1);

commit;


-- 1
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '다음 주 9일 밥메이트 하실 분~', '2021-11-11', null, '중문에서 흑돼지 집 같이 가실 분 구합니다.',7, 5);
-- 2
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '서울 홍대에서 전시회 같이 보실 분 계실까요?', '2021-11-11', null, '반 고흐 인사이드 더 씨어터 전시회 갈 예정인데 날짜는 6일입니다. 혹시 같이 가실 분 !!',12, 2);
-- 3
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '홍대 성수 샤로수길 가로수길 신촌 이태원', '2021-11-11', null, '여기 6곳 중에서 추천 2군데만 해주세요!',55, 3);
-- 4
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '영남 쪽 여행 계획 중인데 KTX랑 비행기 중에 뭐가 나을까요?', '2021-11-11', null, 'KTX랑 비행기 중에 고민인데 조언 좀 해주세요..@',8, 4);
-- 5
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '제주 렌트카', '2021-11-11', null, '렌트카 계획 중인데 혹시 추천해줄 만한 곳 있나요?',12, 5);
-- 6
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '유러피안 재즈 페스티벌 2021 금욜 날 같이 갈 분', '2021-11-11', null, '금요일 20시에 공연 시작하는데 공연 시작하기 전에 가볍게 식사도 하고 같이 공연 봐요',156, 6);
-- 7
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '강원 투어패스 계획 중인데 코스 추천 좀 해주세요.', '도깨비 촬영지인 영진해변에서 사진 찍고 놀 분~',66, 2);
-- 8
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '원주 당일치기', '2021-11-11', null, '당일치기 계획 중인데 핫플 추천 해주세요',17, 4);
-- 9
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '29일 호국기념관 함께 갈 분!', '2021-11-11', null, '혼자 하는 여행이라 호국기념관에 혼자 가시는 분들 계시면 같이 가요~',19, 7);
-- 10
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '동백꽃 스팟', '2021-11-11', null, '22일 날 동백꽃 스팟 방문 예정인데 인생샷 같이 남기면서 놀 분 ;))',23, 6);
-- 11
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '산막와이너리 양조장투어', '2021-11-11', null, '혹시 같이 방문하실 분! 2-3명 정도, 날짜는 23일 입니다.',51, 2);
-- 12
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '구름다리 단풍 구경', '2021-11-11', null, '구름다리에 단풍 구경 갈건데 함께 갈 분!!!! 날짜는 23일입니다',45, 3);
-- 13
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '서해 갯벌체험', '2021-11-11', null, '귀어귀촌 청년수산학교에서 갯벌 체험 예정인데 참여하실 분? 날짜는 10일입니다.',66, 4);
-- 14
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '연애의 온도 전시회 가실 분!', '12월 17일 날 전시회 보러 갈건데 같이 가실 분!! 저 사진 잘 찍어요 ;)',67, 5);
-- 15
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '이태원 LTP한남?', '2021-11-11', null, '여기 괜찮나요? 알려주세요',45, 5);
-- 16
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '이태원에 부다스벨리 괜찮음', '2021-11-11', null, '이태원 여행 계획 있으신 분들 여기도 괜찮더라구요, 추천합니다!',34, 6);
-- 17
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '부산에 혹시 숙박 괜찮은 곳 아시는 분', '2021-11-11', null, '부산 여행 계획 중인데 숙박 괜찮은 곳 알려주세요!',68, 7);
-- 18
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '내일로 해서 여행 다녀보신 분?', '2021-11-11', null, '혹시 코스 어떻게 짰었는지 ..? ',44, 2);
-- 19
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '웨스 앤더슨 전시 얼리버드로 갈 분', '2021-11-11', null, '얼리버드로 갔다가 점심 간단하게 함께 하고 싶어요, 날짜는 18일 입니다!',35, 7);
-- 20
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '가로수길 근처 맛집 추천 해주실 분.!', '2021-11-11', null, '한식, 양식, 일식 가리지 않아서 괜찮은 곳 추천 해주세요!',23, 3);
-- 21
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '플라워 바이 네이키드 전시회', '2021-11-11', null, '동행 구해요 !! 인생샷 남길 분 ..ㅋ@',44, 2);
-- 22
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '서울에 여행 온 김에 전시회 가려고 생각 중인데', '2021-11-11', null, '혹시 사진 잘 찍히는 전시회 추천 해주세요',65, 4);
-- 23
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '거제 풀빌라 추천 좀 해주세요', '2021-11-11', null, '날짜는 15일이고 아기랑 함께 하는 여행이라 걱정이 많네요..',34, 6);
-- 24
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '부산 해운대 요트 투어 계획 중인데', '2021-11-11', null, '혹시 함께 하실 분 있으실까요?!! 2자리 남았어요',87, 5);
-- 25
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '고기국수 같이 먹어주실 밥 메이트 구함..', '2021-11-11', null, '지금 고기국수 먹으러 이동할건데 지금 바로 합류하실 분!',37, 7);
-- 26
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '컬러풀뮤지엄', '2021-11-11', null, '컬러컬러하게 컬러풀뮤지엄 전시회 같이 갈 분 구합니다 !!',46, 6);
-- 27
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '거제 식물원 추천함', '2021-11-11', null, '자연 좋아하는 분들은 힐링 제대로 할 듯!!',2, 3);
-- 28
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '춘천 이상원미술관', '2021-11-11', null, '산이랑 계곡을 끼고 있어서 자연 속에 머물 수 있더라구요, 힐링 완전 되는 곳이라 진짜 추천드려요!',43, 2);
-- 29
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '영덕에서 대게 먹으려고 하는데 맛집 추천 좀.!', '2021-11-11', null, '영덕에서 대게거리 가려고 계획 중인데 맛집 알려주실 분~~~',53, 6);
-- 30
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '세계 최고 미로 메이즈랜드!! 강추강추', '2021-11-11', null, '지도를 봤을 때는 충분히 나올 수 있을거라 생각했지만. 역시나 /// ㅎ 길 잃음!! 제주 여행 가시는 분들이라면 이 곳 추천@',103, 5);
-- 31
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '아래글보다가 생각났는데 선녀와나무꾼도 괜찮아요', '2021-11-11', null, '선녀와나무꾼테마공원인데 과거의 모습들을 볼 수 있어서 재밌었어요!',22, 3);
-- 32
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '카페 에오마르라고 오션뷰 짱인 곳', '2021-11-11', null, '오션뷰가 진짜 괜찮은데다가 실내가 약간 미술관 같은 느낌도 있어서 괜찮더라구요!',66, 3);
-- 33
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '경주 여행 계획 중인데 괜찮은 곳 알려주실 분@.@', '2021-11-11', null, '경주월드 갔다가 갈만한 곳 있을까요~?!!',37, 2);
-- 34
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '중문 테디베어뮤지엄', '2021-11-11', null, '아기자기 귀여운 곳 좋아하면 테디베어박물관 완전 강추! 진짜 귀여움..',44, 7);
-- 35
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '동백 수목원인데 카멜리아힐 거기도 사진 찍기 좋아요', '2021-11-11', null, '안에 전구도 달려있고 해서 분위기 진짜 좋았어요, 한번 가보세요~~',56, 5);
-- 36
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '담양 인생사진 명소', '2021-11-11', null, '인생사진 명소라 그런지 사진 찍을 수 있는 곳 많아서 추천@',43, 6);
-- 37
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '태안 쪽 여행 다녀오신 분들 코스 추천해주세요!', '2021-11-11', null, '글램핑 예정인데 글린이 좀 도와주세요 ..!! ㅎㅎ',45, 7);
-- 38
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '가평 펜션 라스블랑카스 괜찮나요?', '2021-11-11', null, '사진으로만 봤을 때는 뷰나 야경은 괜찮아 보이는데 진짜 머물렀던 분들 어떠셨나요?!',27, 2);
-- 39
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '연화도감이라고 이번에 오픈한 곳', '2021-11-11', null, '혹시 갔다오신 분 있나요? 어떤지 후기 좀 알려주세요~~',46, 3);
-- 40
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '한옥마을 근처 추천 좀', '2021-11-11', null, '운악채한옥마을에서 머물게 됐는데 그 주위에 갈만한 곳 있으면 추천 좀@',87, 4);
-- 41
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '연지못 힐링스팟', '2021-11-11', null, '하늘이 비치는데 사진 찍으면 진짜 예쁘더라구요, 꼭 가보세요!',3, 7);
-- 42
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '신촌에서 잠깐 시간 떼우기 좋은 곳', '2021-11-11', null, '혹시 추천해 주실 분!! 3-4시간 정도 머물 수 있는 곳이요!',4, 2);
-- 43
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '전시회 추천 좀 해주세요', '2021-11-11', null, '서울 여행에서 전시회는 처음인데 사진 예쁘게 찍을 수 있는 곳 추천해주세요',1, 3);
-- 44
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '대학로 연극 가격이 어떻게 되나요?', '2021-11-11', null, '대학로에서 연극은 처음인데 가격이 궁금하네요, 추가로 추천도 해주시면 감사하겠습니다~~',16, 4);
-- 45
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '캠핑 글램핑? 계획 중인데 어디가 괜찮을까요?', '2021-11-11', null, '일단 생각하고 있는 곳은 라플란드랑 트리플펜션&글램핑 여기 생각 중입니다. 더 좋은 곳 있으면 추천해주세요!!',10, 5);
-- 46
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '카라반에서 숙박 해보신 분?', '2021-11-11', null, '카라반은 처음이라 주의해야할 점이 있을까요?',9, 6);
-- 47
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '사진 출사 같이 가실 분', '2021-11-11', null, '해변 쪽 출사 생각 중인데 날짜는 12일입니다. 같이 가실 분들 채팅 걸어주세요',12, 7);
-- 48
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '부산은 뱅기랑 케텍스 중 어떤게 괜찮을지', '2021-11-11', null, '부산 가는데 뱅기랑 케텍스 중에 어떤게 괜찮을지 모르겠네요',24, 4);
-- 49
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '경주 여행 플랜', '2021-11-11', null, '가신 분들 어떻게 짜셨는지 궁금해요!',3, 4);
-- 50
insert into free(free_code, free_title, free_date, free_image, free_content, view_count, user_code) values(FREE_SEQ.nextval, '양평에 패러글라이딩 같이 하실 분!', '2021-11-11', null, '혼자 여행을 하게 돼서 패러글라이딩 같이 할 분 채팅 주세요~!',22, 5);

commit;

insert into board values(BOARD_SEQ.nextval, '아직 정해진 계획은 없고 같이 정해보면 좋을 것 같아요! 같이 맛있는거 먹고 놀러다니면 좋을 것 같아요!', '2021-11-11', null, '대전', '대전 같이 여행하실 분~!', '21/11/12 00:00:00.000000', '21/11/11 00:00:00.000000', 0, 1); 
insert into board values(BOARD_SEQ.nextval, '부산에서 같이 근교 투어하실분 구해요~ 갑자기 가게 되어서 같이 가실 분 구합니다.', '2021-11-11', null, '부산', '부산 여행 1박2일 동행 구해요', '21/11/13 00:00:00.000000', '21/11/12 00:00:00.000000', 0, 2);
insert into board values(BOARD_SEQ.nextval, '울산 같이 동행하실 분 찾습니다~~ 제가 운전을 잘 못해서 운전 잘하시면 좋겠습니다.', '2021-11-11', null, '울산', '울산 같이 동행하실 분!', '21/11/16 00:00:00.000000', '21/11/14 00:00:00.000000', 0, 3);
insert into board values(BOARD_SEQ.nextval, '부산에서 회 먹으려는데 혼자 먹기 비쌀 거 같아서 같이 드실 분 구해요.', '2021-11-11', null, '부산', '부산에서 같이 회 드실 분?', '21/11/14 00:00:00.000000', '21/11/13 00:00:00.000000', 0, 4);
insert into board values(BOARD_SEQ.nextval, '강릉에서 하루 일정 같이 하실 분 구해요^^', '2021-11-12', null, '강원', '강릉에서 하루 일정 같이 하실 분 구해요!', '21/11/19 00:00:00.000000', '21/11/18 00:00:00.000000', 0, 5);
insert into board values(BOARD_SEQ.nextval, '빵순이끼리 같이 성심당 가요~~ㅎㅎ', '2021-11-12', null, '대전', '대전 성심당 같이 가실 분 찾아요!', '21/11/19 00:00:00.000000', '21/11/19 00:00:00.000000', 0, 6);
insert into board values(BOARD_SEQ.nextval, '11월 29일~30일 렌트해서 천천히 한 바퀴 돌려고요! 관심있으신 분은 채팅 주세요!', '2021-11-13', null, '서울', '렌트해서 천천히 한 바퀴 돌면서 여행하실 분', '21/11/30 00:00:00.000000', '21/11/29 00:00:00.000000', 0, 7);
insert into board values(BOARD_SEQ.nextval, '대구 짧게 여행가서 맛집도 가고 좋은 곳도 보고 싶은데 같이 갈 분 있으면 좋겠어요.', '2021-11-13', null, '대구', '대구 여행 가실 분 없나요?? ', '21/11/30 00:00:00.000000', '21/11/29 00:00:00.000000', 0, 1);
insert into board values(BOARD_SEQ.nextval, '휴가를 내어 11월 25일부터 28일까지 여행합니다. 같이 식사하고 여행할 친구 찾아요!', '2021-11-14', null, '광주', '광주 11월25일-28일', '21/11/28 00:00:00.000000', '21/11/25 00:00:00.000000', 0, 2);
insert into board values(BOARD_SEQ.nextval, '서울 혼자 가려는데 같이 맛집가고 그러면 좋을 거 같아요! 채팅 주세요!', '2021-11-14', null, '서울', '서울 어디든 맛집 11월 26일', '21/11/26 00:00:00.000000', '21/11/26 00:00:00.000000', 0, 3);
insert into board values(BOARD_SEQ.nextval, '부산에서 회 먹으려는데 혼자 먹기 비쌀 거 같아서 같이 드실 분 구해요.', '2021-11-14', null, '부산', '부산에서 같이 회 드실 분?', '21/11/24 00:00:00.000000', '21/11/24 00:00:00.000000', 0, 4);
insert into board values(BOARD_SEQ.nextval, '가평 이번에 2박 3일 여행가려고 하는데 일정 맞는 친구가 없네요,, 일정 맞으면 채팅 주세요', '2021-11-15', null, '경기', '가평 11월 28일-30일', '21/11/30 00:00:00.000000', '21/11/28 00:00:00.000000', 0, 5);
insert into board values(BOARD_SEQ.nextval, '맛집 투어가 취미인 사람입니다. 같이 가요!', '2021-11-15', null, '제주', '서귀포시에서 맛집 다니실 분!', '21/11/23 00:00:00.000000', '21/11/21 00:00:00.000000', 0, 6);
insert into board values(BOARD_SEQ.nextval, '이번달 말에 제주도 가서 스쿠터 여행 하고 싶어서요. 혼자하긴 좀 무서워서 동행 찾습니다', '2021-11-16', null, '제주', '제주도에서 스쿠터 여행 하실 분', '21/11/30 00:00:00.000000', '21/11/29 00:00:00.000000', 0, 7); 
 
insert into board values(BOARD_SEQ.nextval, '수원에 오성통닭, 남문통닭, 진미통닭같은 맛집 가실 분 구해요!', '2021-11-16', null, '경기', '수원에서 같이 치킨 맛집 투어해요!', '21/11/28 00:00:00.000000', '21/11/27 00:00:00.000000', 0, 1);
insert into board values(BOARD_SEQ.nextval, '짧게 부산 여행해보려고 하는데 일정 맞고 생각있으신 분 연락주세요~', '2021-11-17', null, '부산', '부산 11월26일-27일', '21/11/27 00:00:00.000000', '21/11/26 00:00:00.000000', 0, 2);
insert into board values(BOARD_SEQ.nextval, '춘천에서 닭갈비 같이 먹고 오실 분 연락주세요.', '2021-11-18', null, '강원', '춘천에서 닭갈비 먹고 오실 분', '21/11/30 00:00:00.000000', '21/11/30 00:00:00.000000', 0, 3);
insert into board values(BOARD_SEQ.nextval, '치킨 먹으러 부산 가려는데 치킨 정말 좋아하시는 분 일정 맞으면 같이 가서 먹어요', '2021-11-19', null, '부산', '부산3대 치킨집 같이 가요', '21/11/26 00:00:00.000000', '21/11/25 00:00:00.000000', 0, 4);
insert into board values(BOARD_SEQ.nextval, '같이 가서 사진찍고 맛집가서 식사할 분 구합니다! 폰으로 사진 잘 찍어드릴게요! 일정 맞으면 채팅 주세요~', '2021-11-19', null, '서울', '서울에서 같이 노실 분??', '21/11/21 00:00:00.000000', '21/11/21 00:00:00.000000', 0, 5);
insert into board values(BOARD_SEQ.nextval, '종달리 가서 같이 놀아요~~', '2021-11-20', null, '제주', '12월 1일~2일 종달리 같이 놀러가실 분!', '21/12/02 00:00:00.000000', '21/12/01 00:00:00.000000', 0, 6);
insert into board values(BOARD_SEQ.nextval, '양떼목장가서 양들 보고 맛집도 가요! 관심있으신 분 연락주세요', '2021-11-20', null, '강원', '양 좋아하시는 분 저랑 같이 양떼목장 가요', '21/11/26 00:00:00.000000', '21/11/25 00:00:00.000000', 0, 7);  
insert into board values(BOARD_SEQ.nextval, '12월 1일에 대구가려고 합니다. 맛집 가는 걸 좋아하는데 같이 가실 분 있으면 더 좋을 거 같아서 글 남겨요~', '2021-11-21', null, '대구', '12월 1일~3일 대구 맛집 투어하실 분', '21/12/03 00:00:00.000000', '21/12/01 00:00:00.000000', 0, 1);
insert into board values(BOARD_SEQ.nextval, '바다 보고 싶어서 울산 가려고 합니다. 혹시 같이 가고 싶으신 분 계시면 채팅주세요!', '2021-11-21', null, '울산', '울산 11월28일-29일', '21/11/29 00:00:00.000000', '21/11/28 00:00:00.000000', 0, 2);
insert into board values(BOARD_SEQ.nextval, '오랜만에 롯데월드가 넘 가고 싶은데 지인들이 시간이 안된다고 해서 같이 가실 분 구해요', '2021-11-22', null, '서울', '11월 23일 롯데월드 같이 갑시다!', '21/11/23 00:00:00.000000', '21/11/23 00:00:00.000000', 0, 3);
insert into board values(BOARD_SEQ.nextval, '동해바다 보러 같이 가요. 바다 보러 가고 싶으신 분 연락주세요~.', '2021-11-22', null, '강원', '11월30일 동해바다 보러 당일치기 가실 분', '21/11/30 00:00:00.000000', '21/11/30 00:00:00.000000', 0, 4);
insert into board values(BOARD_SEQ.nextval, '남해일주 계획중입니다. 남해안따라 부산까지 여행해보고 싶어요', '2021-11-23', null, '부산', '남해일주 계획중입니다.', '21/11/30 00:00:00.000000', '21/11/26 00:00:00.000000', 0, 5);
insert into board values(BOARD_SEQ.nextval, '속초 게스트하우스에서 머물고 설악산, 시장 구경가는 거 어때요??', '2021-11-23', null, '강원', '설악산 같이 등산하러 가실 분 구합니다.', '21/11/28 00:00:00.000000', '21/11/26 00:00:00.000000', 0, 6);
insert into board values(BOARD_SEQ.nextval, '11월 29일~30일 같이 여행가실 분 찾아요. 자차로 서울역에서 출발할 예정입니다.', '2021-11-24', null, '서울', '1박 2일 같이 여행가실 분 찾습니다!', '21/11/30 00:00:00.000000', '21/11/29 00:00:00.000000', 0, 7);  
insert into board values(BOARD_SEQ.nextval, '서울 더현대 가서 구경도 하고 맛집도 가고 싶어서요. 같이 가고 싶으신 분 연락주세요!', '2021-11-24', null, '서울', '여의도 더현대 같이 가실 분 있나요?', '21/11/30 00:00:00.000000', '21/11/30 00:00:00.000000', 0, 1);
insert into board values(BOARD_SEQ.nextval, '11월 28일부터 29일까지 부산여행 동행하실 분 구합니다.', '2021-11-24', null, '부산', '부산 동행하실 분 구해요', '21/11/29 00:00:00.000000', '21/11/28 00:00:00.000000', 0, 2);
insert into board values(BOARD_SEQ.nextval, '송도 한 번 가보고 싶었는데 지인들은 시간이 안된다고 해서 같이 가실 분 구해요', '2021-11-25', null, '서울', '11월 27일 송도 같이 가요!', '21/11/27 00:00:00.000000', '21/11/27 00:00:00.000000', 0, 3);
insert into board values(BOARD_SEQ.nextval, '안녕하세요. 제주도 가려고 합니다. 일정 조정 가능합니다. 같이 가실 분 연락 주세요', '2021-11-26', null, '제주', '제주도 당일치기 가실 분', '21/11/30 00:00:00.000000', '21/11/30 00:00:00.000000', 0, 4);
insert into board values(BOARD_SEQ.nextval, '맛집투어 하고 싶은데 혼자가면 여러 메뉴를 못 시키는 점이 아쉬워서 대구 맛집 투어 동행 구합니다!', '2021-11-28', null, '대구', '혼밥하니까 다양한 음식을 못먹어서,,,', '21/12/01 00:00:00.000000', '21/12/01 00:00:00.000000', 0, 5);
insert into board values(BOARD_SEQ.nextval, '같이 동행할 여성분 구해요. 관심있으시다면 주저없이 채팅 남겨주세요!', '2021-11-30', null, '제주', '제주 올레길 완주 동행 구합니다.', '21/12/03 00:00:00.000000', '21/12/02 00:00:00.000000', 0, 6);
insert into board values(BOARD_SEQ.nextval, '사진 좋아하는 분이랑 여행 가고 싶어요', '2021-12-01', null, '강원', '강원도로 사진 여행 가실 분', '21/12/05 00:00:00.000000', '21/12/04 00:00:00.000000', 0, 7);  
insert into board values(BOARD_SEQ.nextval, '추억을 남기는 여행을 준비합니다. 관심있으면 연락주세요', '2021-12-01', null, '제주', '아름다운 추억을 남겨요~', '21/12/06 00:00:00.000000', '21/12/05 00:00:00.000000', 0, 1);
insert into board values(BOARD_SEQ.nextval, '관심있으신 분 채팅남겨주세요!', '2021-12-02', null, '강원', '강원도 고성, 미시령넘어 인제 백담사 황태구이먹고 드라이브 계획 입니다', '21/12/06 00:00:00.000000', '21/12/05 00:00:00.000000', 0, 2);
insert into board values(BOARD_SEQ.nextval, '대구에 맛집이 많다고 해서 맛집 투어 해보려고 합니다. 같이 가실 분??', '2021-12-02', null, '대구', '대구 당일치기 맛집 투어 가실 분??', '21/12/08 00:00:00.000000', '21/12/08 00:00:00.000000', 0, 3);
insert into board values(BOARD_SEQ.nextval, '동해바다 같이 구경가실 분 구해요~~ 바다 보고 회도 먹고 옵시다!', '2021-12-03', null, '강원', '동해 바다 구경가실 분', '21/12/06 00:00:00.000000', '21/12/05 00:00:00.000000', 0, 4);
insert into board values(BOARD_SEQ.nextval, '광주 여행이 처음이라 혼자가기보다 다른 사람과 같이 가고 싶어요. 광주 여행 하고싶은 분 계시면 연락주세요~', '2021-12-04', null, '광주', '광주 여행 계획중입니다..', '21/12/10 00:00:00.000000', '21/12/08 00:00:00.000000', 0, 5);
insert into board values(BOARD_SEQ.nextval, '부산, 경주 이렇게 두 곳 여유롭게 여행계획 중입니다. 관심있으신 분 연락주세요!!', '2021-12-04', null, '부산', '부산에서 시작해서 경주까지 같이 여행갈 분 구합니다.', '21/12/17 00:00:00.000000', '21/12/13 00:00:00.000000', 0, 6);
insert into board values(BOARD_SEQ.nextval, '강아지랑 여행 가고 싶은데 혼자 가려니 조금 막막해서요. 그래서 강아지 좋아하시는 분이랑 제주도 여행 하고 싶습니다. 괜찮으시면 채팅 남겨주세요', '2021-12-05', null, '제주', '강아지 좋아하시는 분, 같이 여행다녀요!', '21/12/12 00:00:00.000000', '21/12/10 00:00:00.000000', 0, 7);
insert into board values(BOARD_SEQ.nextval, '예전에 직장 동료랑 다녀 왔는데, 너무 재미 있어서 다시 갈려고 하는데 혼자는 싫어서 동행분 구해요.', '2021-12-05', null, '강원', '양양 죽도해변 조아서프 동행 구합니다.', '21/12/08 00:00:00.000000', '21/12/07 00:00:00.000000', 0, 1);
insert into board values(BOARD_SEQ.nextval, '회사 그만두고 친구도 없고 외롭고 우울해서 여행가는데 쓸쓸해서 같이 가줄 친구 구합니다. 서울 연남동 익선동 홍대 가고싶어요. 같이 밥 먹으실 분 구해요~', '2021-12-05', null, '서울', '지방사람인데 서울여행 같이 가줄 친구 구합니다.', '21/12/10 00:00:00.000000', '21/12/10 00:00:00.000000', 0, 2);
insert into board values(BOARD_SEQ.nextval, '월미도가서 놀이기구타고 회도 먹으면서 같이 노실 분 구합니다', '2021-12-06', null, '인천', '월미도 같이 가주실 분??', '21/12/08 00:00:00.000000', '21/12/08 00:00:00.000000', 0, 3);
insert into board values(BOARD_SEQ.nextval, '울산 여행이 처음이라 다른 사람이랑 같이 가보고 싶네요. 괜찮으신 분 연락주세요', '2021-12-06', null, '울산', '울산 여행 동행 구합니다', '21/12/10 00:00:00.000000', '21/12/09 00:00:00.000000', 0, 4);
insert into board values(BOARD_SEQ.nextval, '돼지고기투어 하려는데, 거의 2인분이 최소 주문이라. 매번 2인분씩 먹기엔 양이 많아서 같이 드실분 구합니다.', '2021-12-06', null, '제주', '흑돼지 같이 드실 분.', '21/12/10 00:00:00.000000', '21/12/09 00:00:00.000000', 0, 5);
insert into board values(BOARD_SEQ.nextval, '송도 가보고 싶은데 송도 구경시켜 주실 분 구합니다~', '2021-12-07', null, '인천', '송도 투어 원합니다.', '21/12/12 00:00:00.000000', '21/12/12 00:00:00.000000', 0, 6);
insert into board values(BOARD_SEQ.nextval, '저랑 같이 빵지순례하고 싶으신 분 계시다면 채팅남겨주세요!', '2021-12-07', null, '부산', '1박 2일 부산 빵지순례 같이 할 친구 구합니다!', '21/12/11 00:00:00.000000', '21/12/11 00:00:00.000000', 0, 7);

commit;