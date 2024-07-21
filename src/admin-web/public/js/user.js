let tbody = document.getElementById("tbody");
let btnPreviousPage = document.getElementById("btn-previous-page");
let btnNextPage = document.getElementById("btn-next-page");
let currentPage = document.getElementById("current-page");
let totalPage = document.getElementById("total-page");
let page = 1;
let textSearch = document.getElementById("text-search");
let mode = 1; // 1: get result, 2: search result, 3: sort result
let criteria = 0; // sort criteria
let addCategoryName = document.getElementById("add-category-name");
let addCategoryDescription = document.getElementById("add-category-description");
let addCategoryUrl = document.getElementById("add-category-url");
let addCategory = document.getElementById("add-category");
let addTag = document.getElementById("add-tag");
let btnMode = 1; // 1: add, 2: edit
let selectedId;
let tbodyStoryIn = document.getElementById("tbody-story-in");

getAllCategories();
changeSortColor(0);

function getAllCategories() {
    mode = 1;

    fetch(`http://localhost:3000/category?page=${page}`)
    .then(response => response.json())
    .then(json => {
        showResult(json);
    })
}

function getPreviousPage() {
    page === 1 ? page = 1 : page -= 1;

    if (mode === 1)
        getAllCategories();
    else if (mode === 2)
        search();
    else
        sort();
}

function getNextPage() {
    page === (totalPage.innerHTML - 0) ? page = (totalPage.innerHTML - 0) : page += 1;

    if (mode === 1)
        getAllCategories();
    else if (mode === 2)
        search();
    else
        sort();
}

function search() {
    mode = 2;

    fetch(`http://localhost:3000/category/search?searchContent=${textSearch.value}&page=${page}`)
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
    textSearch.value === "" ? getAllCategories() : search();    

    changeSortColor(0);
}, 1200);

function sort() {
    mode = 3;

    fetch(`http://localhost:3000/category/sort?criteria=${criteria}&page=${page}`)
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

        json.result.forEach(category => {
            rows += `<tr>
                        <td>${category._id}</td>
                        <td>${category.categoryName}</td>
                        <td>${category.categoryDescription}</td>
                        <td>${category.categoryUrl}</td>
                        <td>${category.isCategory ? 
                            "<span class='badge badge-info rounded-pill d-inline'>Danh mục</span>" :
                            "<span class='badge badge-warning rounded-pill d-inline px-3'>Tag</span>"}
                        </td>
                        <td>
                            <div class="dropdown">
                                <button type="button" class="btn btn-secondary" data-toggle="dropdown">
                                <i class="fa-duotone fa-gear"></i>
                                </button>
                                <div class="dropdown-menu">
                                <a onclick="showModalStoryIn('${category._id}')" class="dropdown-item" href="#"><i class="fa-duotone fa-list"></i> Xem tác phẩm</a>
                                <a onclick="showModalAdd('SỬA', '${category._id}')" class="dropdown-item" href="#"><i class="fa-duotone fa-pen"></i> Sửa</a>
                                <a onclick="showModalConfirmDelete('${category._id}')" class="dropdown-item" href="#"><i class="fa-duotone fa-trash"></i> Xóa</a>
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

    $("#modal2-body").html(`Xác nhận xóa danh mục có mã <b>${_id}</b>?`);
    $("#modal2").modal("show");
}

function handleDelete() {
    fetch(`http://localhost:3000/category/delete/${selectedId}`, {
        method: "DELETE"
    })
    .then(response => response.json())
    .then(json => {
        if (json.code === 0) {
            toastr.success(json.message, "Thông báo");
            getAllCategories();
        }
        else
            toastr.error(json.message, "Thông báo");
    })
}

function showModalAdd(title, _id) {
    if (title === "THÊM") {
        btnMode = 1;
        clearInput();
    }
    else if(title === "SỬA") {
        btnMode = 2;
        selectedId = _id;

        fetch(`http://localhost:3000/category/${selectedId}`)
        .then(response => response.json())
        .then(json => {
            if (json.code === 0) {
                addCategoryUrl.value = json.result.categoryUrl;
                addCategoryName.value = json.result.categoryName;
                addCategoryDescription.value = json.result.categoryDescription;
                json.result.isCategory ? addCategory.checked = true : addTag.checked = true;
            }
        })
    }
    else
        ;

    $("#title-modal-add").html(title);
    $("#btn-add").html(title);

    $("#modal1").modal("show");
}

function add() {
    if (btnMode === 1) {
        fetch("http://localhost:3000/category/create", {
            method: "post",
            body: new URLSearchParams({
                categoryUrl: addCategoryUrl.value,
                categoryName: addCategoryName.value,
                categoryDescription: addCategoryDescription.value,
                isCategory: addCategory.checked
            })
        })
        .then(response => response.json())
        .then(json => {
            showToastr(json);
            getAllCategories();

            if (json.code === 0)
                $("#modal1").modal("hide");
        })
    }
    else if (btnMode === 2) {
        fetch(`http://localhost:3000/category/edit/${selectedId}`, {
            method: "put",
            body: new URLSearchParams({
                categoryUrl: addCategoryUrl.value,
                categoryName: addCategoryName.value,
                categoryDescription: addCategoryDescription.value,
                isCategory: addCategory.checked
            })
        })
        .then(response => response.json())
        .then(json => {
            showToastr(json);
            getAllCategories();

            if (json.code === 0)
                $("#modal1").modal("hide");
        })
    }
    else
        ;
}

function clearInput() {
    addCategoryName.value = "";
    addCategoryDescription.value = "";
    addCategoryUrl.value = "";
    addCategory.checked = true;
}

function showModalStoryIn(_id) {
    $("#story-in-title").html(_id);

    fetch(`http://localhost:3000/story/filter?categoryId=${_id}`)
    .then(response => response.json())
    .then(json => {
        let rows = "";
        tbodyStoryIn.innerHTML = "";

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

            tbodyStoryIn.innerHTML = rows;
            $("#modal3").modal("show");
        }
    })
}