####### WeTravel 3팀 프로젝트 구동 Readme #######

WeTravel 웹사이트를 띄우기 위해서는 

   첫째, 백엔드(Spring Project(Final_Spring00) 1개, 
	       SpringBoot Project(Final_Boot00) 1개) 프로젝트와 
          프론트(React(Final_FrontEnd\web)) 프로젝트를 함께 돌려야 한다. 

   둘째, DB 쿼리문을 통해 데이터를 넣어야 한다.

 ### Spring Project 구동

    1) Servers - Tomcat v9.0 Server at localhost 더블 클릭 - Ports 설정
	Tomcat admin port 8083
	HTTP/1.1 9003

    2) Final_Spring00 - 오른쪽 클릭 - Run as - Run on Server

 ### SpringBoot Project 구동

     1) Final_Boot00 - 오른쪽 클릭 - Run as - Java Application

     2) application.properties 설정

	① spring.jpa.hibernate.ddl-auto=create
	
	② Final_FrontEnd 폴더가 있는 실제 경로로 설정한다.

	   예시 ) userFile.dir=C:/Final_FrontEnd/web/public/assets/userimage
	           boardFile.dir=C:/Final_FrontEnd/web/public/assets/boardimage

 ### React 구동

     1) C:\Final_FrontEnd\web>yarn install

     2) C:\Final_FrontEnd\web>yarn start

 ### DB에 데이터 넣기

    3팀 FinalProject 테이블 생성 쿼리문.sql 

	