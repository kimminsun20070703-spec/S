# 🌌 A-Frame 3D Space & Planets Project

팀원과 함께 협업하고 공유하기 위한 A-Frame 기반 3D 웹 프로젝트 저장소입니다.

---

## 📁 프로젝트 구조

```text
├── index.html                  # 메인 3D 웹 씬 (A-Frame)
├── background.jpg              # 배경 이미지
├── Deer.glb                    # 3D 모델 (사슴)
├── gift-157.glb                # 3D 모델 (선물)
├── gino_48-sweet-3255.glb      # 3D 모델 (달콤한 집/오브젝트)
├── pixellabs-snowman-3549.glb  # 3D 모델 (눈사람)
├── wings_of_freedom-star-3056.glb # 3D 모델 (별/날개)
├── server.ps1                  # 로컬 테스트용 PowerShell 웹 서버
├── 서버실행.bat                 # 로컬 서버 원클릭 실행 스크립트
├── .gitignore                  # Git 추적 제외 설정
└── README.md                   # 프로젝트 설명 및 실행 가이드
```

---

## 🚀 로컬 실행 방법

A-Frame 3D 모델(`.glb`)은 웹 보안 정책(CORS)으로 인해 단순 파일 열기(`file:///`)로는 모델이 로드되지 않을 수 있어, 로컬 웹 서버를 통해 실행해야 합니다.

1. **원클릭 실행**:
   - `서버실행.bat` 파일을 더블 클릭하여 실행합니다.
2. **브라우저 접속**:
   - 자동으로 브라우저가 열리거나 `http://localhost:8000` (또는 지정된 포트)로 접속합니다.

---

## 👥 팀 협업 가이드

1. **저장소 복제(Clone)**:
   ```bash
   git clone <GitHub 저장소 URL>
   cd <프로젝트 폴더명>
   ```

2. **브랜치 작업 권장**:
   ```bash
   # 새 작업 브랜치 생성 및 이동
   git checkout -b feature/작업내용

   # 변경사항 커밋
   git add .
   git commit -m "feat: 새로운 기능 또는 에셋 추가"

   # 원격 저장소에 브랜치 푸시
   git push origin feature/작업내용
   ```

3. **Pull Request (PR)**:
   - GitHub 웹사이트에서 `Pull Request`를 열고 팀원 검토 후 `main` 브랜치에 병합(Merge)합니다.
