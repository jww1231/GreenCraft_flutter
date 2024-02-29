
스마트 주유 시스템 프로젝트
프로젝트 개요
본 프로젝트는 IoT 기반의 스마트 주유 시스템을 구현하는 것을 목표로 합니다. 사용자의 편의성을 높이고, 주유 과정의 자동화를 통해 효율성을 극대화하고자 합니다.

시스템 구성도

기능
조율파 센서: 주유 시작 신호 감지
카메라: 차량 번호 인식
Raspberry Pi: 중앙 제어 및 관리
Jetson Orin nano: YOLOv8/OCR을 통한 차량 번호 인식
Django 서버: 중앙 데이터 관리 및 앱, 웹과의 통신
앱(사용자): 주유 상태 모니터링 및 제어
Web(사용자): 주유 기록 확인 및 관리
DB(Oracle): 주유 데이터 저장 및 관리
기술 스택
하드웨어: Raspberry Pi, Jetson Orin nano, 조율파 센서, 카메라
소프트웨어: Django, Flutter, Oracle DB
언어: Python, Dart, SQL
설치 방법
본 섹션에서는 시스템 구성 요소별 설치 방법에 대해 안내합니다.

서버 설정
bash
Copy code
# Django 서버 설정
$ pip install django
$ django-admin startproject smart_fueling
앱 설치
Flutter 앱 빌드 및 설치 방법을 기술합니다.

사용 방법
사용자는 앱을 통해 주유를 시작할 수 있으며, 웹 인터페이스를 통해 주유 기록을 확인할 수 있습니다.
