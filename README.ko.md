# Admin Plus

`release.lua`는 기존 본체 구조를 유지합니다. Signal 라이브러리, 맵, Dex++와 Cobalt는 별도 파일로 배포됩니다.

| 경로 | 내용 |
| --- | --- |
| `release.lua` | Admin Plus 본체 |
| `library/Signal.lua` | SignalPlus |
| `assets/house_` | 원본 맵 데이터 |
| `tools/dex.lua` | Dex++ stable-3.0 |
| `tools/cobalt.luau` | Cobalt 2.2.5.18 |
| `server/WorkspaceDecal.server.lua` | 소유한 게임의 Workspace 전체에 적용하는 선택 설치 스크립트 |

`rnrmfqnrp12345-ux/admin-plus` 저장소의 `main` 브랜치 루트에 이 폴더의 내용물을 그대로 올립니다.

기존 저장소가 공개 재배포 라이선스를 표시하지 않으므로 공개 업로드 전에 본체와 맵의 재배포 권한을 확인합니다.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/rnrmfqnrp12345-ux/admin-plus/main/release.lua", true))()
```

본체는 위의 네 파일을 같은 저장소에서 내려받습니다. 서버 목록과 음악 검색은 Roblox API를 사용합니다.
Dex++와 Cobalt는 원래 배포 파일을 그대로 보관했습니다. 도구 내부의 업데이트나 별도 서비스 요청은
각 도구의 동작을 따릅니다. 타사 라이선스와 고지는 `licenses/`에 포함했습니다.

이전 Discord 웹훅은 제거했습니다. 새 초대 코드는 필요하면 `_G.AdminPlusInvite`에 설정합니다.
이전 차단 기록을 이어 쓰려면 현재 서버에 해당하는 `bans-…` 폴더를 `AdminPlus`에 복사합니다.
`kick`, `kick all`, `ban`은 별도의 재사용 대기시간 없이 실행됩니다.
보호할 계정이 있다면 실행 환경의 로컬 `AdminPlus/access.json`에 `protected` 목록을 지정합니다.
`banAll`, `fakeBaseplate`, `blocked`도 같은 파일에서 각 기능에 해당하는 Roblox 사용자 이름의 배열로 지정합니다.
계정 이름은 현재 Roblox 사용자 이름과 대소문자까지 맞춥니다. 이 설정 파일은 개인 환경에만 둡니다.
스케이트보드를 이용한 강제 이동 감지는 스크립트 실행 시 켜집니다. 서버에서 발생하는 접속 종료는 서버 권한에 따릅니다.

`>decal <asset ID>`는 폴더와 모델 깊이에 관계없이 Workspace 하위 BasePart의 여섯 면을 처리합니다.
적용 중 `>decal stop`을 입력하면 남은 작업을 멈춥니다. 이미 적용된 데칼은 남습니다.
기본 Building Tools 경로는 클라이언트에 로드되어 있고 수정 권한이 있는 파트에 적용합니다.
소유한 게임에서 스트리밍 범위 밖의 파트까지 적용하려면 Roblox Studio의 `ServerScriptService`에
Script를 만든 뒤 `server/WorkspaceDecal.server.lua`의 내용을 붙여 넣고 플레이스에 게시합니다.
이미 서버 스크립트를 설치했다면, 서버 작업 취소를 사용하려면 그 스크립트도 최신 내용으로 교체합니다.
개인 소유 플레이스는 소유자 계정이 실행할 수 있습니다. 그룹 소유 플레이스나 추가 관리자는
서버 Script의 `ADMIN_USER_IDS`에 해당 Roblox 사용자 ID를 추가합니다.
