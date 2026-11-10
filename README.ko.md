# Admin Plus

`release.lua`는 기존 본체 구조를 유지합니다. Signal 라이브러리, 맵, Dex++와 Cobalt는 별도 파일로 배포됩니다.

| 경로 | 내용 |
| --- | --- |
| `release.lua` | Admin Plus 본체 |
| `library/Signal.lua` | SignalPlus |
| `assets/house_` | 원본 맵 데이터 |
| `tools/dex.lua` | Dex++ stable-3.0 |
| `tools/cobalt.luau` | Cobalt 2.2.5.18 |

`rnrmfqnrp12345-ux/admin-plus` 저장소의 `main` 브랜치 루트에 이 폴더의 내용물을 그대로 올립니다.

기존 저장소가 공개 재배포 라이선스를 표시하지 않으므로 공개 업로드 전에 본체와 맵의 재배포 권한을 확인합니다.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/rnrmfqnrp12345-ux/admin-plus/main/release.lua"))()
```

본체는 위의 네 파일을 같은 저장소에서 내려받습니다. 서버 목록과 음악 검색은 Roblox API를 사용합니다.
Dex++와 Cobalt는 원래 배포 파일을 그대로 보관했습니다. 도구 내부의 업데이트나 별도 서비스 요청은
각 도구의 동작을 따릅니다. 타사 라이선스와 고지는 `licenses/`에 포함했습니다.

이전 Discord 웹훅은 제거했습니다. 새 초대 코드는 필요하면 `_G.AdminPlusInvite`에 설정합니다.
이전 차단 기록을 이어 쓰려면 현재 서버에 해당하는 `bans-…` 폴더를 `AdminPlus`에 복사합니다.
`kick`, `kick all`, `ban`은 별도의 재사용 대기시간 없이 실행됩니다.
