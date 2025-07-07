//사이드바 색상 변경 함수
function setSidebarColor(color) {
    const sidebarElement = document.getElementById("sidebar");
    if (sidebarElement && color) {
        sidebarElement.style.backgroundColor = color;
    }
}

function setProfileImage(imageUrl) {
    const containerEl = document.getElementById('profile-image');
    if (!containerEl) return;

    // 컨테이너 스타일 세팅 (필요시)
    containerEl.style.width = '150px';
    containerEl.style.height = '150px';
    containerEl.style.borderRadius = '50%';
    containerEl.style.overflow = 'hidden';
    containerEl.style.boxShadow = '0 2px 8px rgba(0,0,0,0.2)';
    containerEl.style.margin = '50px auto 0 auto';

    // 기존 이미지가 있으면 삭제
    containerEl.innerHTML = '';

    const imageEl = document.createElement('img');
    imageEl.src = imageUrl;
    imageEl.alt = '프로필 이미지';
    imageEl.style.width = '100%';
    imageEl.style.height = '100%';
    imageEl.style.display = 'block';
    imageEl.style.margin = '0 auto';
    imageEl.style.objectFit = 'cover';
    imageEl.style.objectPosition = 'center 15%';

    containerEl.appendChild(imageEl);
}

function setMainProfileName(name, color = '#ffffff') {
    const nameEl = document.getElementById('name');
    if (!nameEl) return;

    nameEl.textContent = name;
    nameEl.style.color = color;
    nameEl.style.textAlign = 'center';
    nameEl.style.margin = '10px 0 0 0';
    nameEl.style.fontSize = '24px';
    nameEl.style.border = 'none';
}

function setProfileDescription(desc, color = 'rgba(255, 255, 255, 0.8)') {
    const introEl = document.getElementById('intro');
    if (!introEl) return;

    introEl.textContent = desc;
    introEl.style.color = color;
    introEl.style.textAlign = 'center';
    introEl.style.fontSize = '16px';
    introEl.style.margin = '4px 0 0 0';
}

function setUnderlineType(style = 'dotted', color = '#ffffff', height = '2px') {
    const underline = document.getElementById('underline');
    if (!underline) return;

    underline.style.height = height;
    underline.style.width = '100%';
    underline.style.margin = '10px auto 10px';
    underline.style.borderBottomStyle = style;
    underline.style.borderBottomWidth = height;
    underline.style.borderBottomColor = color;
}

function setProfileIconList(items) {
    const profileIconContainer = document.getElementById('profile-icon-container');

    // 기존 아이템 초기화
    profileIconContainer.innerHTML = '';

    // 공통 스타일 설정
    profileIconContainer.style.display = 'flex';
    profileIconContainer.style.marginTop = '30px';
    profileIconContainer.style.flexDirection = 'row';
    profileIconContainer.style.flexWrap = 'wrap';
    profileIconContainer.style.justifyContent = 'space-evenly';
    profileIconContainer.style.alignItems = 'center';
    profileIconContainer.style.flexGrow = "1";
    profileIconContainer.style.gap = "16px";

    // 아이템 생성
    items.forEach(item => {
        const itemDiv = document.createElement('div');
        itemDiv.style.display = 'flex';
        itemDiv.style.flexDirection = 'column';
        itemDiv.style.alignItems = 'center';
        itemDiv.style.margin = '10px 15px';


        const circleDiv = document.createElement('div');
        circleDiv.style.width = '96px';
        circleDiv.style.height = '96px';
        circleDiv.style.borderRadius = '50%';
        circleDiv.style.backgroundColor = item.backgroundColor || 'rgb(241,244,246)';
        circleDiv.style.display = 'flex';
        circleDiv.style.justifyContent = 'center';
        circleDiv.style.alignItems = 'center';
        circleDiv.style.boxShadow = '0 2px 6px rgba(0,0,0,0.3)';
        circleDiv.style.marginBottom = '12px';

        const iconImg = document.createElement('img');
        iconImg.src = item.icon;
        iconImg.style.width = '48px';
        iconImg.style.height = '48px';
        iconImg.style.borderRadius = '50%';
        iconImg.style.objectFit = 'cover';

        circleDiv.appendChild(iconImg);

        const descDiv = document.createElement('div');
        descDiv.textContent = item.description;
        descDiv.style.fontSize = '14px';
        descDiv.style.color = item.textColor || '#ffffff';
        descDiv.style.textAlign = 'center';

        itemDiv.appendChild(circleDiv);
        itemDiv.appendChild(descDiv);

        profileIconContainer.appendChild(itemDiv);
    });
}

function setBigSlimName(text = "Default Name", color = "#000000") {
    const bigSlimeName = document.getElementById("big-slime-name");
    if (!bigSlimeName) return;

    bigSlimeName.textContent = text;
    bigSlimeName.style.fontWeight = "300";
    bigSlimeName.style.fontSize = "48px";
    bigSlimeName.style.color = color;
    bigSlimeName.style.width = "100%";
    bigSlimeName.style.textAlign = "center";
    bigSlimeName.style.letterSpacing = "2px";
}
function setSubProfileName(text, textColor, borderColor, backgroundColor = "#ffffff") {
    const profileName = document.getElementById("profile-name");
    if (!profileName) return;

    profileName.textContent = text;
    profileName.style.borderRadius = "30px";
    profileName.style.padding = "10px";
    profileName.style.width = "90%";
    profileName.style.color = textColor;
    profileName.style.fontWeight = "bold";
    profileName.style.backgroundColor = backgroundColor;
    profileName.style.textAlign = "center";
    profileName.style.border = `2px solid ${borderColor}`;
    profileName.style.marginLeft = "auto";
    profileName.style.marginRight = "auto";
}

function setKeywords(keywords) {
    const keywordsContainer = document.getElementById("keywords-container");

    // 기존 내용 초기화 (중복 방지)
    keywordsContainer.innerHTML = '';

    keywordsContainer.style.display = "flex";
    keywordsContainer.style.flexWrap = "wrap"; // 줄 바꿈 허용
    keywordsContainer.style.width = "80%";
    keywordsContainer.style.gap = "12px";
    keywordsContainer.style.justifyContent = "flex-start";
    keywordsContainer.style.marginLeft = "auto";
    keywordsContainer.style.marginRight = "auto";

    keywords.forEach(({ text, color }) => {
        const kwDiv = document.createElement("div");
        kwDiv.style.flex = "0 0 48%";  // 2개씩 한 줄
        kwDiv.style.display = "flex";
        kwDiv.style.alignItems = "center";
        kwDiv.style.gap = "8px";
        kwDiv.style.color = color || "#afd4ff"; // 기본 색상
        kwDiv.style.fontWeight = "500";

        // 빈 원 (테두리만)
        const circle = document.createElement("span");
        circle.style.display = "inline-block";
        circle.style.width = "6px";
        circle.style.height = "6px";
        circle.style.border = `2px solid ${color || "#afd4ff"}`;
        circle.style.borderRadius = "50%";
        circle.style.verticalAlign = "middle";
        circle.style.position = "relative";
        circle.style.top = "-2px";

        // 텍스트
        const textSpan = document.createElement("span");
        textSpan.textContent = text;

        kwDiv.appendChild(circle);
        kwDiv.appendChild(textSpan);

        keywordsContainer.appendChild(kwDiv);
    });
}

function setDescription(text, color = "#999999") {
    const description = document.getElementById("description");
    description.style.width = "80%";
    description.style.whiteSpace = "normal";
    description.style.marginTop = "15px";
    description.style.marginLeft = "auto";
    description.style.marginRight = "auto";
    description.style.color = color;          // 글자 색상
    description.style.minHeight = "80px";  // 최소 높이 지정
    description.style.fontWeight = "400";
    description.style.lineHeight = "1.6";    // 줄 간격 부드럽게
    description.textContent = text;           // 글씨 내용 설정
}

function setWorkExperienceTitle(text, textColor = "#afd4ff", borderColor = "#afd4ff", backgroundColor = "#ffffff") {
    const workExperienceName = document.getElementById("work-experience-name");
    if (!workExperienceName) return;

    workExperienceName.textContent = text;
    workExperienceName.style.borderRadius = "30px";
    workExperienceName.style.padding = "10px";
    workExperienceName.style.width = "90%";
    workExperienceName.style.color = textColor;
    workExperienceName.style.fontWeight = "bold";
    workExperienceName.style.backgroundColor = backgroundColor;
    workExperienceName.style.textAlign = "center";
    workExperienceName.style.border = `2px solid ${borderColor}`;
    workExperienceName.style.marginLeft = "auto";
    workExperienceName.style.marginRight = "auto";
}

function setWorkExperienceTimeline(items, options = {}) {
    const {
        borderColor = "#ccc",         // 세로 dotted 선 색
        dateColor = "#5bb1ec",        // 날짜 색상
        titleColor = "#000000",       // 제목 색상
        descColor = "#999999",        // 설명 색상
        fontSize = {
            date: "14px",
            title: "16px",
            desc: "14px"
        }
    } = options;

    const container = document.getElementById("work-experience-time-line");
    if (!container) return;

    container.innerHTML = ""; // 기존 내용 초기화
    container.style.width = "85%";
    container.style.marginLeft = "auto";
    container.style.marginRight = "auto";
    container.style.position = "relative";
    container.style.borderLeft = `2px dotted ${borderColor}`;
    container.style.paddingLeft = "20px";

    items.forEach(item => {
        const itemDiv = document.createElement("div");
        itemDiv.style.position = "relative";
        itemDiv.style.marginBottom = "40px";

        // 날짜
        const dateDiv = document.createElement("div");
        dateDiv.innerText = `${item.start} ~ ${item.end}`;
        dateDiv.style.color = dateColor;
        dateDiv.style.fontWeight = "bold";
        dateDiv.style.fontSize = fontSize.date;
        dateDiv.style.marginBottom = "5px";

        // 제목
        const titleDiv = document.createElement("div");
        titleDiv.innerText = item.title;
        titleDiv.style.fontWeight = "bold";
        titleDiv.style.fontSize = fontSize.title;
        titleDiv.style.color = titleColor;
        titleDiv.style.marginBottom = "5px";

        // 설명
        const descriptionDiv = document.createElement("div");
        descriptionDiv.innerHTML = item.description;
        descriptionDiv.style.color = descColor;
        descriptionDiv.style.fontSize = fontSize.desc;
        descriptionDiv.style.lineHeight = "1.4";

        // 조립
        itemDiv.appendChild(dateDiv);
        itemDiv.appendChild(titleDiv);
        itemDiv.appendChild(descriptionDiv);
        container.appendChild(itemDiv);
    });
}

function setCharacterTitle(text, textColor = "#afd4ff", borderColor = "#afd4ff", backgroundColor = "#ffffff") {
    const characterName = document.getElementById("character-name");
    if (!characterName) return;

    characterName.textContent = text;
    characterName.style.borderRadius = "30px";
    characterName.style.padding = "10px";
    characterName.style.width = "90%";
    characterName.style.color = textColor;
    characterName.style.fontWeight = "bold";
    characterName.style.backgroundColor = backgroundColor;
    characterName.style.textAlign = "center";
    characterName.style.border = `2px solid ${borderColor}`;
    characterName.style.marginLeft = "auto";
    characterName.style.marginRight = "auto";
}

function setCharacterItems(characterList = []) {
    const characterItemContainer = document.getElementById("character-item-container");
    if (!characterItemContainer) return;

    characterItemContainer.innerHTML = ''; // 초기화

    // container 스타일
    characterItemContainer.style.display = "flex";
    characterItemContainer.style.justifyContent = "center";
    characterItemContainer.style.gap = "40px";
    characterItemContainer.style.marginTop = "20px";
    characterItemContainer.style.flexWrap = "wrap";

    characterList.forEach((item) => {
        const {
            icon,
            title,
            subtitle,
            color = "#d9eaff",
            textColor = "#333333",
            subtitleColor = "#777777",
            borderColor
        } = item;

        const wrapperDiv = document.createElement("div");
        wrapperDiv.style.display = "flex";
        wrapperDiv.style.flexDirection = "column";
        wrapperDiv.style.alignItems = "center";
        wrapperDiv.style.textAlign = "center";

        // 원형 아이콘 영역
        const circleDiv = document.createElement("div");
        circleDiv.style.width = "100px";
        circleDiv.style.height = "100px";
        circleDiv.style.borderRadius = "50%";
        circleDiv.style.backgroundColor = color;
        circleDiv.style.display = "flex";
        circleDiv.style.alignItems = "center";
        circleDiv.style.justifyContent = "center";
        circleDiv.style.boxShadow = "0 0 10px rgba(0, 0, 0, 0.1)";
        circleDiv.style.marginBottom = "10px";
        const finalBorderColor = borderColor || darkenColor(color, 0.1);
        circleDiv.style.border = `2px solid ${finalBorderColor}`;

        // 아이콘 이미지
        const iconImg = document.createElement("img");
        iconImg.src = icon;
        iconImg.alt = `${title} 아이콘`;
        iconImg.style.width = "84px";
        iconImg.style.height = "84px";
        iconImg.style.borderRadius = "50%";
        iconImg.style.objectFit = "cover";
        iconImg.style.objectPosition = 'center 20%';

        circleDiv.appendChild(iconImg);

        // 제목
        const titleDiv = document.createElement("div");
        titleDiv.textContent = title;
        titleDiv.style.fontSize = "14px";
        titleDiv.style.fontWeight = "bold";
        titleDiv.style.color = textColor;
        titleDiv.style.marginBottom = "4px";

        // 서브제목
        const subtitleDiv = document.createElement("div");
        subtitleDiv.textContent = subtitle;
        subtitleDiv.style.fontSize = "12px";
        subtitleDiv.style.color = subtitleColor;

        // 조립
        wrapperDiv.appendChild(circleDiv);
        wrapperDiv.appendChild(titleDiv);
        wrapperDiv.appendChild(subtitleDiv);
        characterItemContainer.appendChild(wrapperDiv);
    });
}

// 색상 어둡게 조정
function darkenColor(color, amount = 0.2) {
    let r = parseInt(color.slice(1, 3), 16);
    let g = parseInt(color.slice(3, 5), 16);
    let b = parseInt(color.slice(5, 7), 16);

    r = Math.max(0, Math.min(255, Math.floor(r * (1 - amount))));
    g = Math.max(0, Math.min(255, Math.floor(g * (1 - amount))));
    b = Math.max(0, Math.min(255, Math.floor(b * (1 - amount))));

    return `#${r.toString(16).padStart(2, "0")}${g.toString(16).padStart(2, "0")}${b.toString(16).padStart(2, "0")}`;
}
