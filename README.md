# DtrPASS
ERC721을 확장한 ERC721Enumerable을 다시 확장한 버전의 NFT.

### 주요기능
minterRole 설정으로 컨트랙 자체나 owner가 아닌 다른 특정 컨트랙트에도 민트할 수 있는 기능을 부여하여 NFT 채굴 등으로 사용 가능.
OwnedList 함수를 이용하여 Enumerable에는 없는 기능인 특정 유저가 가진 NFT의 id를 한번에 리턴받을 수 있음.
