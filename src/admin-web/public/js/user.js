let tbody = document.getElementById("tbody");
let btnPreviousPage = document.getElementById("btn-previous-page");
let btnNextPage = document.getElementById("btn-next-page");
let currentPage = document.getElementById("current-page");
let totalPage = document.getElementById("total-page");
let page = 1;
let textSearch = document.getElementById("text-search");
let mode = 1; // 1: get result, 2: search result, 3: sort result
let criteria = 0; // sort criteria
let selectedId;
let tbodyStoryOf = document.getElementById("tbody-story-of");
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

getAllUsers();
changeSortColor(0);

function getAllUsers() {
    mode = 1;

    fetch(`http://localhost:3000/user?page=${page}`)
    .then(response => response.json())
    .then(json => {
        showResult(json);
    })
}

function getPreviousPage() {
    page === 1 ? page = 1 : page -= 1;

    if (mode === 1)
        getAllUsers();
    else if (mode === 2)
        search();
    else
        sort();
}

function getNextPage() {
    page === (totalPage.innerHTML - 0) ? page = (totalPage.innerHTML - 0) : page += 1;

    if (mode === 1)
        getAllUsers();
    else if (mode === 2)
        search();
    else
        sort();
}

function search() {
    mode = 2;

    fetch(`http://localhost:3000/user/search?searchContent=${textSearch.value}&page=${page}`)
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
    textSearch.value === "" ? getAllUsers() : search();    

    changeSortColor(0);
}, 1200);

function sort() {
    mode = 3;

    fetch(`http://localhost:3000/user/sort?criteria=${criteria}&page=${page}`)
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

        json.result.forEach(user => {
            rows += `<tr>
                        <td><img src="https://cdn.thestorygraph.com/tramdo57b9nn0eewwszz8dme47v2" class="rounded-circle"/></td>
                        <td>${user._id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.displayName}</td>
                        <td>${user.isLock ? 
                            "<span class='badge badge-danger rounded-pill d-inline'>Tài khoản bị khóa</span>" :
                            "<span class='badge badge-success rounded-pill d-inline px-3'>Bình thường</span>"}
                        </td>
                        <td>
                            <div class="dropdown">
                                <button type="button" class="btn btn-secondary" data-toggle="dropdown">
                                <i class="fa-duotone fa-gear"></i>
                                </button>
                                <div class="dropdown-menu">
                                <a onclick="showModalUserDetail('${user._id}')" class="dropdown-item" href="#"><i class="fa-duotone fa-circle-info"></i> Xem chi tiết</a>
                                <a onclick="showModalStoryOf('${user._id}')" class="dropdown-item" href="#"><i class="fa-duotone fa-list"></i> Xem tác phẩm</a>
                                <a onclick="lock('${user._id}')" class="dropdown-item" href="#">${user.isLock ? "<i class='fa-duotone fa-lock-open'></i> Mở khóa" : "<i class='fa-duotone fa-lock'></i> Khóa"}</a>
                                <a onclick="showModalConfirmDelete('${user._id}')" class="dropdown-item" href="#"><i class="fa-duotone fa-trash"></i> Xóa</a>
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

function showToastr(json) {
    if (json.code === 0)
        toastr.success(json.message, "Thông báo");
    else
        toastr.error(json.message, "Thông báo");
}

function showModalConfirmDelete(_id) {
    selectedId = _id;

    $("#modal2-body").html(`Xác nhận xóa người dùng có mã <b>${_id}</b>?`);
    $("#modal2").modal("show");
}

function handleDelete() {
    fetch(`http://localhost:3000/user/delete/${selectedId}`, {
        method: "DELETE"
    })
    .then(response => response.json())
    .then(json => {
        if (json.code === 0) {
            toastr.success(json.message, "Thông báo");
            getAllUsers();
        }
        else
            toastr.error(json.message, "Thông báo");
    })
}

function lock(_id) {
    fetch(`http://localhost:3000/user/lock`, {
        method: "PUT",
        body: new URLSearchParams({
            _id: _id
        })
    })
    .then(response => response.json())
    .then(json => {
        if (json.code === 0) {
            toastr.success(json.message, "Thông báo");
            getAllUsers();
        }
        else
            toastr.error(json.message, "Thông báo");
    })
}

function showModalStoryOf(_id) {
    $("#story-of-title").html(_id);

    fetch(`http://localhost:3000/story/filter?fk_publisherAccount=${_id}`)
    .then(response => response.json())
    .then(json => {
        let rows = "";
        tbodyStoryOf.innerHTML = "";

        if (json.code === 0) {
            json.result.forEach(story => {
                rows += `<tr>
                            <td><img src="https://cdn.thestorygraph.com/tramdo57b9nn0eewwszz8dme47v2" class="w-100"></td>
                            <td>${story._id}</td>
                            <td>${story.storyName}</td>
                            <td>${story.authorName}</td>
                            <td>${story.publisherName}</td>
                            <td>${story.chapterCount}</td>
                            <td>${story.fk_publisherAccount}</td>
                            <td>${story.createdDate}</td>
                            <td>${story.published ? 
                                "<span class='badge badge-success rounded-pill d-inline'>Đã đăng</span>" :
                                "<span class='badge badge-danger rounded-pill d-inline'>Chưa đăng</span>"}
                            </td>
                        </tr>`
            })

            tbodyStoryOf.innerHTML = rows;
            $("#modal4").modal("show");
        }
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