let tbody = document.getElementById("tbody");
let btnPreviousPage = document.getElementById("btn-previous-page");
let btnNextPage = document.getElementById("btn-next-page");
let currentPage = document.getElementById("current-page");
let totalPage = document.getElementById("total-page");
let page = 1;
let textSearch = document.getElementById("text-search");
let mode = 1; // 1: get result, 2: search result, 3: sort result
let criteria = 0; // sort criteria
let detailId = document.getElementById("detail-id")
let detailImage = document.getElementById("detail-image")
let detailName = document.getElementById("detail-name")
let detailAuthor = document.getElementById("detail-author")
let detailUser = document.getElementById("detail-user")
let detailCreateDate = document.getElementById("detail-create-date")
let detailView = document.getElementById("detail-view")
let detailVote = document.getElementById("detail-vote")
let detailComment = document.getElementById("detail-comment")
let detailChapter = document.getElementById("detail-chapter")
let detailContent = document.getElementById("detail-content")
let detailUrl = document.getElementById("detail-url")
let detailPublisher = document.getElementById("detail-publisher")
let detailIsbn = document.getElementById("detail-isbn")
let detailCategory = document.getElementById("detail-category")
let detailSelfCompose = document.getElementById("detail-self-compose")
let detailMature = document.getElementById("detail-mature")
let detailStatus = document.getElementById("detail-status")
let detailPublishDate = document.getElementById("detail-publish-date")
let detailCommercial = document.getElementById("detail-commercial")
let detailPrice = document.getElementById("detail-price")
let selectedId;
let detailUserId = document.getElementById("detail-user-id");
let detailBgUserImage = document.getElementById("bg-user-image");
let detailUserImage = document.getElementById("detail-user-image");
let detailUserUsername = document.getElementById("detail-user-username");
let detailUserDisplayName = document.getElementById("detail-user-display-name");
let detailUserEmail = document.getElementById("detail-user-email");
let detailUserRole = document.getElementById("detail-user-role");
let detailUserSelfIntroduction = document.getElementById("detail-user-self-introduction");
let detailUserDateOfBirth = document.getElementById("detail-user-date-of-birth");
let detailUserFavGenreKeywords = document.getElementById("detail-user-fav-genre-keywords");
let detailUserAccountBalance = document.getElementById("detail-user-account-balance");

getAllStories();
changeSortColor(0);

function getAllStories() {
    mode = 1;

    fetch(`http://localhost:3000/story?page=${page}`)
    .then(response => response.json())
    .then(json => {
        showResult(json);
    })
}

function getPreviousPage() {
    page === 1 ? page = 1 : page -= 1;

    if (mode === 1)
        getAllStories();
    else if (mode === 2)
        search();
    else
        sort();
}

function getNextPage() {
    page === (totalPage.innerHTML - 0) ? page = (totalPage.innerHTML - 0) : page += 1;

    if (mode === 1)
        getAllStories();
    else if (mode === 2)
        search();
    else
        sort();
}

function search() {
    mode = 2;

    fetch(`http://localhost:3000/story/search?searchContent=${textSearch.value}&page=${page}`)
    .then(response => response.json())
    .then(json => {
        showResult(json);
        showToastr(json);
    })
}

// Only send request for searching when user finish input after 1.5s
function debounce(func, delay) {
    let timeout;

    return function(...args) {
        clearTimeout(timeout);
        
        timeout = setTimeout(() => {
            func.apply(this, args);
        }, delay);
    };
}

let handleSearchInput = debounce((event) => {
    page = 1;
    textSearch.value === "" ? getAllStories() : search();    

    changeSortColor(0);
}, 1200);

function sort() {
    mode = 3;

    fetch(`http://localhost:3000/story/sort?criteria=${criteria}&page=${page}`)
    .then(response => response.json())
    .then(json => {
        showResult(json);
        showToastr(json);
    })
}

function handleSortSelect(selectedCriteria) {
    page = 1;
    criteria = selectedCriteria;

    textSearch.value = "";
    sort();

    changeSortColor(selectedCriteria);
}

function showResult(json) {
    let rows = "";
    tbody.innerHTML = "";

    if (json.code === 0) {
        if(json.result.length === 0) {
            currentPage.innerHTML = 1;
            totalPage.innerHTML = 1;

            return;
        }

        json.result.forEach(story => {
            rows += `<tr>
                        <td>${story._id}</td>
                        <td>${story.storyName}</td>
                        <td>${story.authorName}</td>
                        <td>${story.publisherName}</td>
                        <td>${story.chapterCount}</td>
                        <td><a onclick="showModalUserDetail('${story.fk_publisherAccount}')" href="#" class="text-decoration-underline">${story.fk_publisherAccount}</a></td>
                        <td>${story.createdDate}</td>
                        <td>${story.published ? 
                            "<span class='badge badge-success rounded-pill d-inline'>Đã đăng</span>" :
                            "<span class='badge badge-danger rounded-pill d-inline'>Chưa đăng</span>"}
                        </td>
                        <td>
                            <div class="dropdown">
                                <button type="button" class="btn btn-secondary" data-toggle="dropdown">
                                <i class="fa-duotone fa-gear"></i>
                                </button>
                                <div class="dropdown-menu">
                                <a onclick="publish('${story._id}')" class="dropdown-item" href="#">${story.published ? "<i class='fa-duotone fa-eye-slash'></i> Hủy đăng tải" : "<i class='fa-duotone fa-eye'></i> Đăng tải"}</a>
                                <a onclick="showModalStoryDetail('${story._id}')" class="dropdown-item" href="#"><i class="fa-duotone fa-circle-info"></i> Xem chi tiết</a>
                                <a onclick="showModalConfirmDelete('${story._id}')" class="dropdown-item" href="#"><i class="fa-duotone fa-trash"></i> Xóa</a>
                                </div>
                            </div>
                        </td>
                    </tr>`
        })

        tbody.innerHTML = rows;

        currentPage.innerHTML = json.currentPage;
        totalPage.innerHTML = json.totalPages;
    }

    // console.log(json)
}

// Change color of dropdown sort when select a sort criteria
function changeSortColor(selectedCriteria) {
    let sorts = document.querySelectorAll('[id^="sort"]');

    sorts.forEach(s => {
        if (s.getAttribute("id") === "sort" + selectedCriteria)
            s.classList.add("text-primary");
        else
            s.classList.remove("text-primary");
    })
}

function publish(_id) {
    fetch(`http://localhost:3000/story/publish`, {
        method: "PUT",
        body: new URLSearchParams({
            _id: _id
        })
    })
    .then(response => response.json())
    .then(json => {
        if (json.code === 0) {
            toastr.success(json.message, "Thông báo");
            getAllStories();
        }
        else
            toastr.error(json.message, "Thông báo");
    })
}

function showToastr(json) {
    if (json.code === 0)
        toastr.success(json.message, "Thông báo");
    else
        toastr.error(json.message, "Thông báo");
}

function showModalStoryDetail(_id) {
    fetch(`http://localhost:3000/story/${_id}`)
    .then(response => response.json())
    .then(json => {
        if(json.code === 0) {
            detailId.innerHTML = _id;
            detailImage.setAttribute("src", "https://cdn.thestorygraph.com/tramdo57b9nn0eewwszz8dme47v2");
            detailName.innerHTML = json.result.storyName;
            detailAuthor.innerHTML = json.result.authorName; 
            detailUser.innerHTML = json.result.fk_publisherAccount;
            detailCreateDate.innerHTML = json.result.createdDate; 
            showStarRating(json.result.ratingPoint - 0);
            detailView.innerHTML = formatNumber(json.result.viewCount - 0); 
            detailVote.innerHTML = formatNumber(json.result.voteCount - 0); 
            detailComment.innerHTML = formatNumber(json.result.commentCount - 0); 
            detailChapter.innerHTML = formatNumber(json.result.chapterCount - 0);
            detailContent.innerHTML = json.result.contentOutline;
            detailUrl.innerHTML = "<b>URL: </b>" +  json.result.url; 
            detailPublisher.innerHTML = "<b>Nhà xuất bản: </b>" + json.result.publisherName; 
            detailIsbn.innerHTML = "<b>ISBN: </b>" + json.result.ISBNcode; 
            detailCategory.innerHTML = "<b>Danh mục: </b>" + json.result.categoriesAndTags; 
            detailSelfCompose.innerHTML = "<b>Truyện tự sáng tác: </b>" + (json.result.selfComposedStory ? '<i class="fa-solid fa-thumbs-up text-success"></i>' : '<i class="fa-solid fa-thumbs-down text-danger"></i>');
            detailMature.innerHTML = "<b>Nội dung người lớn: </b>" + (json.result.matureContent ? '<i class="fa-solid fa-thumbs-up text-success"></i>' : '<i class="fa-solid fa-thumbs-down text-danger"></i>');
            detailStatus.innerHTML = "<b>Trạng thái: </b>" + (json.result.published ? 
            "<span class='badge badge-success rounded-pill d-inline'>Đã đăng</span>" :
            "<span class='badge badge-danger rounded-pill d-inline'>Chưa đăng</span>");
            detailPublishDate.innerHTML = "<b>Ngày phát hành: </b>" + json.result.publishDate; 
            detailCommercial.innerHTML = "<b>Sách thương mại: </b>" + (json.result.commercialActivated ? '<i class="fa-solid fa-thumbs-up text-success"></i>' : '<i class="fa-solid fa-thumbs-down text-danger"></i>');
            detailPrice.innerHTML = "<b>Giá bán: </b>" + json.result.storySellPrice.toLocaleString('vi-VN') + "đ";

            $("#modal1").modal("show");
        }
    })
}

function showStarRating(nStars) {
    let stars = document.querySelectorAll('.fa-star');
    let count = 0;

    stars.forEach(s => {
        if (count < nStars) 
            s.classList.add("text-warning");
        else 
            s.classList.remove("text-warning");
    
        count++;
    });
}

// format to: 1200 -> 1.2k, 1200000 -> 1.2m
function formatNumber(n) {
    if (n >= 1000000)
        return (n / 1000000).toFixed(1) + 'm';
    else if (n >= 1000) 
        return (n / 1000).toFixed(1) + 'k';
    else 
        return n.toString();
}

function showModalConfirmDelete(_id) {
    selectedId = _id;

    $("#modal2-body").html(`Xác nhận xóa tác phẩm có mã <b>${_id}</b>?`);
    $("#modal2").modal("show");
}

function handleDelete() {
    fetch(`http://localhost:3000/story/delete/${selectedId}`, {
        method: "DELETE"
    })
    .then(response => response.json())
    .then(json => {
        if (json.code === 0) {
            toastr.success(json.message, "Thông báo");
            getAllStories();
        }
        else
            toastr.error(json.message, "Thông báo");
    })
}

function showModalUserDetail(_id) {
    fetch(`http://localhost:3000/user/profile/${_id}`)
    .then(response => response.json())
    .then(json => {
        if(json.code === 0) {
            detailUserId.innerHTML = _id;
            detailBgUserImage.setAttribute("src", "https://cdn.thestorygraph.com/tramdo57b9nn0eewwszz8dme47v2");
            detailUserImage.setAttribute("src", "https://cdn.thestorygraph.com/tramdo57b9nn0eewwszz8dme47v2");
            detailUserUsername.innerHTML = "<b>Tài khoản: </b>" + json.result.username;
            detailUserDisplayName.innerHTML = "<b>Tên hiển thị: </b>" + json.result.displayName;
            detailUserEmail.innerHTML = "<b>Email: </b>" + json.result.email;
            detailUserRole.innerHTML = "<b>Vai trò: </b>" + json.result.role;
            detailUserSelfIntroduction.innerHTML = "<b>Giới thiệu: </b>" + json.result.selfIntroduction;
            detailUserDateOfBirth.innerHTML = "<b>Ngày sinh: </b>" + json.result.dateOfBirth;
            detailUserFavGenreKeywords.innerHTML = "<b>Thể loại yêu thích: </b>" + json.result.favGenreKeywords;
            detailUserAccountBalance.innerHTML = "<b>Số dư: </b>" + json.result.accountBalance.toLocaleString('vi-VN') + "đ";

            $("#modal3").modal("show");
        }
    })   
}