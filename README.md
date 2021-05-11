# fastapi-bgtasks

## Purpose

* FastAPI 및 BackgroundTasks 기능 테스트
* BackgroundTasks에서 외부 프로그램 실행
* Heroku 배포

## Demo Link

* https://fastapi-bgtasks-test.herokuapp.com/
* https://fastapi-bgtasks-test.herokuapp.com/model-3d/test@email.com

## How to run

```
pipenv install
pipenv shell
uvicorn app.main:app --reload
(또는 2~3라인을 한번에 실행 시, pipenv run uvicorn app.main:app --reload)
```

## Problem

* Heroku에서 FUSE 마운트 미지원으로 AppImage 실행 불가. [참고 링크](https://pelson.github.io/2017/heroku_fuse_mount/)