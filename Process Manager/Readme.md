Process Manager
===
***

Kubernetes가 Container를 Orchestration하는걸 생각하며 만들었지만 전혀 아닌 어떤것

### 특징

  1. 일정 주기 restart cycle 를 주어서 일정 시간마다 프로세스 재시작을 해줄 수 있다. 
  2. 프로세스가 특정 상황이나 충돌로 오류가 나서 꺼져도 다시 프로세스를 살린다

### 권장 사용법

  - alias를 사용해 축약 명령어를 등록하고 쓰시는게 더 편합니다(경험)

### 사용법

  1. 우선 execute.sh에 실행하고자 하는 파일을 실행할 때 작성하는 명령어를 적어줍니다(\`~\`사이에)
  2. bash autoStart.sh (실행하는 파일명(확장자는 안적어도됩니다)) (restart 주기) 를 적으면 실행이 됩니다.
  3. RestartLog.txt에 재시작 될때, 사용자가 직접 끄는 경우, 강제종료되는 경우 세가지 경우에 대해 로그를 남깁니다
  4. bash manualclose.sh 가 프로세스를 잠시 끌때 사용하는 명령어입니다.
  5. bash flushProcess.sh 를 사용하면 이 관리툴과 프로세스를 같이 종료해줍니다.

### 기본적인 매개변수

  - bash autoStart.sh에 두개의 매개변수가 필요로 합니다.
    
    1. 실행하는 프로세스명 : 프로세스 이름만 써도 되고 확장자까지 기재해줘도 됩니다.
    2. restart 주기 : 프로세스를 재실행해주는 주기입니다. ex) 1s : 1초 / 1m : 1분 / 1h : 1시간 / 1d : 1일

  - 이외 매개변수 필요하지 않습니다.

### 사용 예시

![1](https://user-images.githubusercontent.com/45956041/121886264-31b5ae00-cd50-11eb-9988-d215fd4ae85c.png)

  - 위 사진과 같이 execute.sh에 관리하고자 하는 프로세스 실행 명령어를 써주면 됩니다.
  - 만약 매개변수 두개가 입력되지 않으면 에러창을 띄웁니다.

![2](https://user-images.githubusercontent.com/45956041/121886490-69245a80-cd50-11eb-93cb-c483bdfb6aeb.png)

  - bash autoStart 명령어를 실행해주면 최초 실행의 경우 RestartLog.txt, managelog.txt파일을 생성합니다. 
  - managelog.txt에는 실행하는 프로세스에서 내보내는 메세지를 저장하며, RestartLog.txt는 프로세스가  재실행된 경우에 대해 로그를 남깁니다.
 
![3](https://user-images.githubusercontent.com/45956041/121886812-dafca400-cd50-11eb-9c3f-15dfa81a1f88.png)

  - 재시작 주기마다 프로세스가 재시작되면서 로그를 작성합니다
   
![4](https://user-images.githubusercontent.com/45956041/121886916-07182500-cd51-11eb-81cd-bdffd5af7e9d.png)

  - 수동으로 프로세스를 종료하는 경우
 
 ![5](https://user-images.githubusercontent.com/45956041/121887095-43e41c00-cd51-11eb-9219-edf70e147729.png)
 
  - 강제종료가 된 경우
 
 ![6](https://user-images.githubusercontent.com/45956041/121887231-70983380-cd51-11eb-8fba-66f4b85a8e26.png)
 
  - 프로세스 관리 툴 완전 종료
