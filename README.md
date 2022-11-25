# 🏪 오픈마켓 프로젝트

- 팀 프로젝트 (2인) 
- 기간 : 2022-10-24 ~ 2022-11-18 (4주)

## STEP1 구현내용

- `OpenMarketAPI` - 서버 통신 프로토콜 구현

![스크린샷 2022-11-22 오후 12 01 15](https://user-images.githubusercontent.com/105549066/203210777-750536d1-05c6-433d-987d-78866d345a5d.png)

- `OpenMarketURL` - URL 구조 프로토콜 구현

![스크린샷 2022-11-22 오후 12 02 40](https://user-images.githubusercontent.com/105549066/203210935-a28d7d02-265a-468a-b741-39b1f1da4a51.png)

- `NetWorkError` - 통신할 때 발생하는 에러 구현

![스크린샷 2022-11-22 오후 12 03 09](https://user-images.githubusercontent.com/105549066/203211006-faa6b728-1e07-4229-8ca6-356692b23190.png)

- `NetWork` - 네트워크 통신 함수 구현

![스크린샷 2022-11-22 오후 12 03 48](https://user-images.githubusercontent.com/105549066/203211082-b8a46fd0-e92c-43bb-b7f9-584584a61f67.png)
![스크린샷 2022-11-22 오후 12 04 10](https://user-images.githubusercontent.com/105549066/203211132-106042a4-43c1-490c-8c09-91d623706724.png)

- 매칭할 모델 타입들 구현

![스크린샷 2022-11-22 오후 12 05 15](https://user-images.githubusercontent.com/105549066/203211268-d9bfa132-887d-4735-b6bf-47727ca2c421.png)
![스크린샷 2022-11-22 오후 12 05 36](https://user-images.githubusercontent.com/105549066/203211300-089fdd5e-d0f3-41ce-9c76-53dbdccd0c65.png)

- Mock 데이터 유닛 테스트 진행

![스크린샷 2022-11-22 오후 12 05 58](https://user-images.githubusercontent.com/105549066/203211346-6a28c9fb-af01-4792-937d-c96b9b71f993.png)

## STEP1 아쉬웠던 점

- POP 방식 말고 두 모델을 한번에 처리할 수 있는 하나의 메서드를 구현하고 싶었지만 마음처럼 구현하지 못한 점
- URL 구조를 나눌 때 URLComponent 메서드를 활용하여 쿼리 파라미터를 만들어서 나누고 싶었지만 완성 못한 점


## STEP2 구현내용 

![스크린샷 2022-11-22 오전 11 49 42](https://user-images.githubusercontent.com/105549066/203209168-e62b4fa3-137f-4e5f-97fd-fe95d1ff9004.png)

https://user-images.githubusercontent.com/105549066/203208870-b08c6297-894d-49dc-a581-ef07e6c020f1.mov

modernCollectionView 코드로 구현, UICollectionViewDiffableDataSource를 사용하여 데이터를 관리하고 UICollectionViewCompositionalLayout를 사용해 레이아웃(아이템, 그룹, 섹션) 크기 조정

- `ViewController` - data를 불러오는 `getData` 메서드를 구현 `UICollectionViewCompositionalLayout`를 사용해 레이아웃 크기 조정, `createGridCollectionView` 메서드로 컬렉션뷰 레이아웃 지정, `configDataSource` 메서드로 커스텀 셀에서 데이터를 반환해 데이터 저장
- `ProductCollectionViewCell` - 필요한 ui들을 추가하고 `setLayout` 메서드로 레이아웃에 들어가는 데이터 지정 및 이미지 제약 <- 다른 label들은 스택뷰로 굳이 제약을 지정하지 않아도 되게 설정, configCell 메서드로 ui에 데이터 넣기

<img width="639" alt="스크린샷 2022-11-22 오후 12 15 14" src="https://user-images.githubusercontent.com/87158656/203212588-fbfc86ab-8487-43dc-b02f-bb1f68e50099.png">
ui들을 스택뷰에 추가



