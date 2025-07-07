setSidebarColor("#f28b82");

setProfileImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7huXcURRbebvFFeOjBGUF1zFnqCvJS4RQ2GQHnNiu15llGLm-aVHy5WU&s");

setMainProfileName("신짱구","#ffffff");
setProfileDescription("떡잎마을 유치원","#ffffff");

setUnderlineType('dotted', '#ffffff', '3px');

const tempItems = [
    {
        icon: '../icon/social_zip/icons8-phone-50.png',
        description: '010-1234-1234',
        backgroundColor: 'rgb(241,244,246)',  // 동그라미 배경색
        textColor: '#ffffff'                   // 설명 텍스트 색상
    },
    {
        icon: '../icon/social_zip/icons8-git-50-2.png',
        description: 'https://github.com/JOODON',
        backgroundColor: 'rgb(200,230,201)',
        textColor: '#000000'
    },
    {
        icon: '../icon/social_zip/icons8-notion-50.png',
        description: 'https://www.notion.com/',
        backgroundColor: 'rgb(255,224,178)',
        textColor: '#333333'
    },
    {
        icon: '../icon/social_zip/icons8-youtube-logo-48.png',
        description: 'https://www.youtube.com/',
        backgroundColor: 'rgb(220,165,165)',
        textColor: '#ffffff'
    },
];

setProfileIconList(tempItems)

setBigSlimName("Shinnosuke-Nohara","#f4d2d0")

setSubProfileName("ABOUT ME", "#ff5555", "#ff5555","#ede1e1");

setKeywords([
    { text: "나를 설명하는 키워드 1", color: "#afd4ff" },
    { text: "키워드 두번째", color: "#ff6666" },
    { text: "세번째 키워드", color: "#66cc66" },
]);

setDescription("" +
    " 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋" +
    " 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋" +
    " 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋 느좋",
    '#c3f6c3')

setWorkExperienceTitle(
    "WORK EXPERIENCE",  // 텍스트 내용
    "#ffffff",          // 텍스트 색상 (흰색)
    "#dca5a5",          // 테두리 색상 (하늘색 계열)
    "#5bb1ec"           // 배경 색상 (같은 하늘색)
);

const tempWorkExperienceList = [
    {
        start: "2012-06",
        end: "2012-07",
        title: "프로젝트 혹은 경력사항 첫 번째",
        description: "기획·디자인을 맡아 해당 경력사항을 수행하였습니다.<br>경력사항에 관한 텍스트를 입력해주세요."
    },
    {
        start: "2013-10",
        end: "2013-11",
        title: "두111111 번째 프로젝트",
        description: "백엔드 API 개발 및 테스트 진행"
    },
    {
        start: "2013-12",
        end: "2014-01",
        title: "세 번째 프로젝트",
        description: "운영 자동화 및 시스템 구성"
    }
];

setWorkExperienceTimeline(tempWorkExperienceList, {
    borderColor: "#5bb1ec",
    dateColor: "#ff0000",
    titleColor: "#c3f6c3",
    descColor: "#666",
    fontSize: {
        date: "13px",
        title: "18px",
        desc: "14px"
    }
});

setCharacterTitle("CHARACTER", "#5bb1ec", "#5bb1ec", "#ffffff");

const tempCharacterList = [
    {
        icon: "https://cdn-icons-png.flaticon.com/512/223/223404.png",
        title: "책임감과 끈기",
        subtitle: "포기를 모르는",
        color: "#ffffff",
        textColor: "#ff0000",
        subtitleColor: "#000000"
    },
    {
        icon: "https://cdn-icons-png.flaticon.com/512/223/223404.png",
        title: "긍정적 에너지",
        subtitle: "언제나 밝은",
        color: "#dbf2ff"
    },
    {
        icon: "https://cdn-icons-png.flaticon.com/512/223/223404.png",
        title: "무한한 열정",
        subtitle: "지치지 않는",
        color: "#b2dcf6",
        textColor: "#000",
        subtitleColor: "#444",
        borderColor: "#3c7ba0"
    }
];

setCharacterItems(tempCharacterList)
