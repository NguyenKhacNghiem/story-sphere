let selectChart = document.getElementById("select-chart");
let outerChart0 = document.getElementById("outer-chart-0");
let chart0 = document.getElementById('chart0'); 
let currentChart; // store current chart to destroy it before generate another chart

getChart();

function getChart() {
    let value = selectChart.value - 0;

    if (currentChart)
        currentChart.destroy();

    if (value === 0) {
        outerChart0.style.width = "50%";

        fetch("http://localhost:3000/statistic/quantity")
        .then(response => response.json())
        .then(json => {            
            let result = json.result;

            currentChart = new Chart(chart0, {
                type: 'polarArea',
                data: {
                    labels: ['Tác Phẩm', 'Chương', 'Danh Mục', 'Người Dùng', 'Comment', 'Review'],
                    datasets: [{
                        data: result,
                        backgroundColor: getRandomColorArray(result.length),
                        label: 'Số lượng',
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        title: {
                            display: true,
                            text: 'THỐNG KÊ SỐ LƯỢNG',
                            align: 'center',
                            font: {
                                size: 20
                            }
                        },
                        legend: {
                            display: true
                        }
                    },
                    // scales: {
                    //     x: {
                    //         title: {
                    //             display: true,
                    //             text: 'Thành Phần'
                    //         },
                    //         grid: {
                    //             display: false
                    //         },
                    //     },
                    //     y: {
                    //         title: {
                    //             display: true,
                    //             text: 'Số Lượng'
                    //         },
                    //         beginAtZero: true,
                    //         grid: {
                    //             display: true
                    //         },
                    //     }
                    // }
                }
            });
        })
    }
    else if (value === 1) {
        outerChart0.style.width = "75%";

        fetch("http://localhost:3000/statistic/quantity-by-category")
        .then(response => response.json())
        .then(json => {
            // Because at BE: Map -> JSON so in FE: JSON -> Map
            let result = new Map(Object.entries(json.result));
            let arrayKey = Array.from(result.keys());
            let arrayValue = Array.from(result.values());

            currentChart = new Chart(chart0, {
                type: 'bar',
                data: {
                    labels: arrayKey,
                    datasets: [{
                        label: "Số lượng tác phẩm",
                        data: arrayValue,
                        backgroundColor: getRandomColorArray(arrayKey.length),
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        title: {
                            display: true,
                            text: 'THỐNG KÊ SỐ LƯỢNG TÁC PHẨM THEO DANH MỤC',
                            align: 'center',
                            font: {
                                size: 20
                            }
                        },
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Tên Danh Mục'
                            },
                            grid: {
                                display: false
                            },
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Số Lượng Tác Phẩm'
                            },
                            beginAtZero: true,
                            grid: {
                                display: true
                            },
                            ticks: {
                                stepSize: 1
                            }
                        }
                    }
                }
            });
        })
    }
    else if (value === 2) {
        outerChart0.style.width = "75%";

        fetch("http://localhost:3000/statistic/top-10-user")
        .then(response => response.json())
        .then(json => {
            // Because at BE: Map -> JSON so in FE: JSON -> Map
            let result = new Map(Object.entries(json.result));
            let arrayKey = Array.from(result.keys());
            let arrayValue = Array.from(result.values());

            currentChart = new Chart(chart0, {
                type: 'bar',
                data: {
                    labels: arrayKey,
                    datasets: [{
                        label: "Số lượng tác phẩm đăng tải",
                        data: arrayValue,
                        backgroundColor: getRandomColorArray(arrayKey.length),
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        title: {
                            display: true,
                            text: 'TOP 10 NGƯỜI DÙNG ĐĂNG TẢI NHIỀU TÁC PHẨM NHẤT',
                            align: 'center',
                            font: {
                                size: 20
                            }
                        },
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Tài Khoản'
                            },
                            grid: {
                                display: false
                            },
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Số Lượng Tác Phẩm'
                            },
                            beginAtZero: true,
                            grid: {
                                display: true
                            },
                            ticks: {
                                stepSize: 1
                            }
                        }
                    }
                }
            });
        })
    }
    else if (value === 3) {
        outerChart0.style.width = "75%";

        fetch("http://localhost:3000/statistic/top-10-story")
        .then(response => response.json())
        .then(json => {
            // Because at BE: Map -> JSON so in FE: JSON -> Map
            let result = new Map(Object.entries(json.result));
            let arrayKey = Array.from(result.keys());
            let arrayValue = Array.from(result.values());

            currentChart = new Chart(chart0, {
                type: 'bar',
                data: {
                    labels: arrayKey,
                    datasets: [
                        {
                            label: "Lượt xem",
                            data: arrayValue,
                            backgroundColor: getRandomColorArray(arrayKey.length),
                        },
                    ]
                },
                options: {
                    responsive: true,
                    plugins: {
                        title: {
                            display: true,
                            text: 'TOP 10 TÁC PHẨM CÓ LƯỢT XEM CAO NHẤT',
                            align: 'center',
                            font: {
                                size: 20
                            }
                        },
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Tác Phẩm'
                            },
                            grid: {
                                display: false
                            },
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Lượt Xem'
                            },
                            beginAtZero: true,
                            grid: {
                                display: true
                            }
                        }
                    }
                }
            });
        })
    }
    else
        toastr.error("Lựa chọn không tồn tại", "Thông báo")
}