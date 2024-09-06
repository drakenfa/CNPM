// const { default: jsPDF } = require("jspdf");

const salaryChart = document.getElementById("salary");
const exportChart = document.getElementById("export");
const importChart = document.getElementById("import");
const profitChart = document.getElementById("profit");
const salaryConfig = {
    type: "bar",
    data: {
        labels: [
            "Tháng 1",
            "Tháng 2",
            "Tháng 3",
            "Tháng 4",
            "Tháng 5",
            "Tháng 6",
            "Tháng 7",
            "Tháng 8",
            "Tháng 9",
            "Tháng 10",
            "Tháng 11",
            "Tháng 12",
        ],
        datasets: [
            {
                label: "Tổng lương",
                data: [
                    20000000, 260000000, 150000000, 100000000, 180000000, 190000000,
                    220000000, 190000000, 170000000, 200000000, 230000000, 160000000,
                    220000000,
                ],
                backgroundColor: ["rgba(255, 99, 132)"],
                borderWidth: 2,
            },
        ],
    },
    options: {
        plugins: {
            title: {
                display: true,
                text: "Biểu đồ tổng lương trả cho tất cả nhân viên qua các tháng trong năm 2024",
                font: {
                    size: 20,
                },
            },
        },
        scales: {
            y: {
                beginAtZero: true,
            },
        },
    },
}
var salaryChartEntity = new Chart(salaryChart, salaryConfig);


const urlYearSalary = '../TimesheetDetail/GetDistinctYear';
let dataYearSalary = [];

fetch(urlYearSalary)
    .then(response => response.json()) 
    .then(json => {
        dataYearSalary = json; // Lưu dữ liệu vào mảng
        // Thêm các năm vào combobox
        dataYearSalary.forEach((item, index, array) => {
            let option = document.createElement('option');
            option.value = item.year;
            option.text = item.year;

            if (index === array.length - 1) {
                option.selected = true;
            }
            console.log(item.year);
            yearSelectSalary.add(option);
        });
        fetchDataAndUpdateSalaryChart(urlMonthSalary+dataYearSalary.pop().year);
    })
    .catch(error => console.error('Error:', error));

let yearSelectSalary = document.getElementById('year-salary');



const urlMonthSalary = '../TimesheetDetail/GetTotalSalaryByMonth/';
const urlQuarterSalary = '../TimesheetDetail/GetTotalSalaryByQuarter/';
const radioMonthSalary = document.querySelector("#month-salary");
const radioQuarterSalary = document.querySelector("#quarter-salary");


function fetchDataAndUpdateSalaryChart(url){
    let isQuarter = url.includes('Quarter');
    let length = isQuarter ? 4 : 12;
    let labels = Array.from({length}, (_, i) => isQuarter ? `Quý ${i+1}` : `Tháng ${i+1}`);
    let year = url.slice(-4); // Lấy năm từ url

    fetch(url)
    .then(response => response.json())
    .then(data => {
        let salary = Array(length).fill(0);

        if(isQuarter){
            data.forEach(item => {
                let index = parseInt(item.quarter) - 1; 
                salary[index] = parseFloat(item.total_salary); 
            });
            salaryConfig.options.plugins.title.text = `Biểu đồ tổng lợi nhuận thu được qua các quý trong năm ${year}`;
        }else{
            data.forEach(item => {
                let index = parseInt(item.month) - 1; 
                salary[index] = parseFloat(item.total_salary); 
            });
            salaryConfig.options.plugins.title.text = `Biểu đồ tổng lợi nhuận thu được qua các tháng trong năm ${year}`;
        }

        salaryConfig.data.labels = labels;
        salaryConfig.data.datasets[0].data = salary;
        salaryChartEntity.update();
    })
    .catch(error => console.error('Error:', error));
}


yearSelectSalary.addEventListener('change', (event) => {
    let year = event.target.value;
    let url = radioQuarterSalary.checked ? `${urlQuarterSalary}${year}` : `${urlMonthSalary}${year}`;
    fetchDataAndUpdateSalaryChart(url);
});

radioMonthSalary.addEventListener('change', () => {
    let year = yearSelectSalary.value;
    let url = `${urlMonthSalary}${year}`;
    console.log(year);
    fetchDataAndUpdateSalaryChart(url);
});

radioQuarterSalary.addEventListener('change', () => {
    let year = yearSelectSalary.value;
    let url = `${urlQuarterSalary}${year}`;
    console.log(year);
    fetchDataAndUpdateSalaryChart(url);
});


var downloadSalaryChartJs = () => {
    html2canvas(document.getElementById("salary")).then((canvas) => {
        var img = canvas.toDataURL(); //image data of canvas
        var doc = new jsPDF("l", "mm", "a4");

        doc.addImage(img, "PNG", 30, 10);
        doc.save("salary_statistic.pdf");
    });
};
document.getElementById("download-salary-chart").addEventListener("click", downloadSalaryChartJs);

// Profit
const profitConfig = {
    type: "bar",
    data: {
        labels: [
            "Tháng 1",
            "Tháng 2",
            "Tháng 3",
            "Tháng 4",
            "Tháng 5",
            "Tháng 6",
            "Tháng 7",
            "Tháng 8",
            "Tháng 9",
            "Tháng 10",
            "Tháng 11",
            "Tháng 12",
        ],
        datasets: [
            {
                label: "Tổng lợi nhuận",
                data: [
                    14000000, 16000000, 15000000, 10000000, 18000000, 19000000,
                    22000000, 19000000, 12000000, 20000000, 23000000, 36000000,
                    25000000,   
                ],
                backgroundColor: ["rgba(255, 99, 132)"],
                borderWidth: 2,
            },
        ],
    },
    options: {
        plugins: {
            title: {
                display: true,
                text: "Biểu đồ tổng lợi nhuận thu được qua các tháng trong năm 2024",
                font: {
                    size: 20,
                },
            },
        },
        scales: {
            y: {
                beginAtZero: true,
            },
        },
    },
}
var profitChartEntity = new Chart(profitChart, profitConfig);


const urlYearProfit = '../Export/GetDistinctYear';
let dataYearProfit = [];

fetch(urlYearProfit)
    .then(response => response.json()) 
    .then(json => {
        dataYearProfit = json; // Lưu dữ liệu vào mảng
        // Thêm các năm vào combobox
        dataYearProfit.forEach((item, index, array) => {
            let option = document.createElement('option');
            option.value = item.year;
            option.text = item.year;

            if (index === array.length - 1) {
                option.selected = true;
            }
            console.log(item.year);
            yearSelectProfit.add(option);
        });
        fetchDataAndUpdateProfitChart(urlMonthProfit+dataYearProfit.pop().year);
    })
    .catch(error => console.error('Error:', error));

let yearSelectProfit = document.getElementById('year-profit');



const urlMonthProfit = '../Export/GetProfitByMonth/';
const urlQuarterProfit = '../Export/GetProfitByQuarter/';
const radioMonthProfit = document.querySelector("#month-profit");
const radioQuarterProfit = document.querySelector("#quarter-profit");


function fetchDataAndUpdateProfitChart(url){
    let isQuarter = url.includes('Quarter');
    let length = isQuarter ? 4 : 12;
    let labels = Array.from({length}, (_, i) => isQuarter ? `Quý ${i+1}` : `Tháng ${i+1}`);
    let year = url.slice(-4); // Lấy năm từ url

    fetch(url)
    .then(response => response.json())
    .then(data => {
        let profits = Array(length).fill(0);

        if(isQuarter){
            data.forEach(item => {
                let index = parseInt(item.quarter) - 1; 
                profits[index] = parseFloat(item.profit); 
            });
            profitConfig.options.plugins.title.text = `Biểu đồ tổng lợi nhuận thu được qua các quý trong năm ${year}`;
        }else{
            data.forEach(item => {
                let index = parseInt(item.month) - 1; 
                profits[index] = parseFloat(item.profit); 
            });
            profitConfig.options.plugins.title.text = `Biểu đồ tổng lợi nhuận thu được qua các tháng trong năm ${year}`;
        }

        profitConfig.data.labels = labels;
        profitConfig.data.datasets[0].data = profits;
        profitChartEntity.update();
    })
    .catch(error => console.error('Error:', error));
}


yearSelectProfit.addEventListener('change', (event) => {
    let year = event.target.value;
    let url = radioQuarterProfit.checked ? `${urlQuarterProfit}${year}` : `${urlMonthProfit}${year}`;
    fetchDataAndUpdateProfitChart(url);
});

radioMonthProfit.addEventListener('change', () => {
    let year = yearSelectProfit.value;
    let url = `${urlMonthProfit}${year}`;
    fetchDataAndUpdateProfitChart(url);
});

radioQuarterProfit.addEventListener('change', () => {
    let year = yearSelectProfit.value;
    let url = `${urlQuarterProfit}${year}`;
    fetchDataAndUpdateProfitChart(url);
});

var downloadProfitChartJs = () => {
    html2canvas(document.getElementById("profit")).then((canvas) => {
        var img = canvas.toDataURL(); //image data of canvas
        var doc = new jsPDF("l", "mm", "a4");

        doc.addImage(img, "PNG", 30, 10);
        doc.save("profit_statistic.pdf");
    });
};
document.getElementById("download-profit-chart").addEventListener("click", downloadProfitChartJs);


// Export
const exportData = {
    labels: [
        "Tháng 1",
        "Tháng 2",
        "Tháng 3",
        "Tháng 4",
        "Tháng 5",
        "Tháng 6",
        "Tháng 7",
        "Tháng 8",
        "Tháng 9",
        "Tháng 10",
        "Tháng 11",
        "Tháng 12",
    ],
    datasets: [
        {
            label: "Số lượng sản phẩm bán ra",
            data: [65, 59, 80, 81, 56, 55, 20, 65, 59, 90, 81, 56, 55],
            fill: false,
            borderColor: "rgb(75, 192, 192)",
            tension: 0.1,
        },
    ],
};
const exportConfig = {
    type: "line",
    data: exportData,
    options: {
        plugins: {
            title: {
                display: true,
                text: "Biểu đồ số lượng sản phẩm bán ra hàng tháng trong năm 2024",
                font: {
                    size: 20,
                    color: 'blue',
                },
            },
        },
        scales: {
            y: {
                beginAtZero: true,
            },
        },
    },
};

var exportChartEntity = new Chart(exportChart ,exportConfig);

const urlYearExport = '../Export/GetDistinctYear';
let dataYearExport = [];

fetch(urlYearExport)
    .then(response => response.json()) 
    .then(json => {
        dataYearExport = json; // Lưu dữ liệu vào mảng
        // Thêm các năm vào combobox
        dataYearExport.forEach((item, index, array) => {
            let option = document.createElement('option');
            option.value = item.year;
            option.text = item.year;
            
            if (index === array.length - 1) {
                option.selected = true;
            }
            console.log(item.year);
            yearSelectExport.add(option);
        });
        fetchDataAndUpdateExportChart(urlMonthExport+dataYearExport.pop().year);
    })
    .catch(error => console.error('Error:', error));

let yearSelectExport = document.getElementById('year-export');



const urlMonthExport = '../Export/GetQuantityExportByMonth/';
const urlQuarterExport = '../Export/GetQuantityExportByQuarter/';
const radioMonthExport = document.querySelector("#month-export");
const radioQuarterExport = document.querySelector("#quarter-export");


function fetchDataAndUpdateExportChart(url){
    let isQuarter = url.includes('Quarter');
    let length = isQuarter ? 4 : 12;
    let labels = Array.from({length}, (_, i) => isQuarter ? `Quý ${i+1}` : `Tháng ${i+1}`);
    let year = url.slice(-4); // Lấy năm từ url

    fetch(url)
    .then(response => response.json())
    .then(data => {
        let exportQuantity = Array(length).fill(0);

        if(isQuarter){
            data.forEach(item => {
                let index = parseInt(item.quarter) - 1; 
                exportQuantity[index] = parseFloat(item.total_quantity); 
            });
            exportConfig.options.plugins.title.text = `Biểu đồ tổng số lượng sản phẩm bán ra qua các quý trong năm ${year}`;
        }else{
            data.forEach(item => {
                let index = parseInt(item.month) - 1; 
                exportQuantity[index] = parseFloat(item.total_quantity); 
            });
            exportConfig.options.plugins.title.text = `Biểu đồ tổng số lượng sản phẩm bán ra qua các tháng trong năm ${year}`;
        }

        exportConfig.data.labels = labels;
        exportConfig.data.datasets[0].data = exportQuantity;
        exportChartEntity.update();
    })
    .catch(error => console.error('Error:', error));
}

yearSelectExport.addEventListener('change', (event) => {
    let year = event.target.value;
    let url = radioQuarterExport.checked ? `${urlQuarterExport}${year}` : `${urlMonthExport}${year}`;
    fetchDataAndUpdateExportChart(url);
});

radioMonthExport.addEventListener('change', () => {
    let year = yearSelectExport.value;
    let url = `${urlMonthExport}${year}`;
    fetchDataAndUpdateExportChart(url);
});

radioQuarterExport.addEventListener('change', () => {
    let year = yearSelectExport.value;
    let url = `${urlQuarterExport}${year}`;
    fetchDataAndUpdateExportChart(url);
});

var downloadExportChartJs = () => {
    html2canvas(document.getElementById("export")).then((canvas) => {
        var img = canvas.toDataURL(); //image data of canvas
        var doc = new jsPDF("l", "mm", "a4");

        doc.addImage(img, "PNG", 30, 10);
        doc.save("export_statistic.pdf");
    });
};
document.getElementById("download-export-chart").addEventListener("click", downloadExportChartJs);

// Import
const importData = {
    labels: [
        "Tháng 1",
        "Tháng 2",
        "Tháng 3",
        "Tháng 4",
        "Tháng 5",
        "Tháng 6",
        "Tháng 7",
        "Tháng 8",
        "Tháng 9",
        "Tháng 10",
        "Tháng 11",
        "Tháng 12",
    ],
    datasets: [
        {
            label: "Số lượng sản phẩm nhập vào",
            data: [65, 50, 80, 60, 101, 85, 50, 65, 59, 90, 20, 51, 32],
            fill: false,
            borderColor: "rgb(75, 192, 192)",
            tension: 0.1,
        },
    ],
};
const importConfig = {
    type: "line",
    data: importData,
    options: {
        plugins: {
            title: {
                display: true,
                text: "Biểu đồ số lượng sản phẩm nhập vào hàng tháng trong năm 2024",
                font: {
                    size: 20,
                    color: 'blue',
                },
            },
        },
        scales: {
            y: {
                beginAtZero: true,
            },
        },
    },
};

var importChartEntity = new Chart(importChart ,importConfig);
const urlYearImport = '../Import/GetDistinctYear';
let dataYearImport = [];

fetch(urlYearImport)
    .then(response => response.json()) 
    .then(json => {
        dataYearImport = json; // Lưu dữ liệu vào mảng
        dataYearImport.forEach((item, index, array) => {
            let option = document.createElement('option');
            option.value = item.year;
            option.text = item.year;

            if (index === array.length - 1) {
                option.selected = true;
            }
            console.log(item.year);
            yearSelectImport.add(option);
        });
        fetchDataAndUpdateImportChart(urlMonthImport+dataYearImport.pop().year);
    })
    .catch(error => console.error('Error:', error));

let yearSelectImport = document.getElementById('year-import');



const urlMonthImport = '../Import/GetQuantityImportByMonth/';
const urlQuarterImport = '../Import/GetQuantityImportByQuarter/';
const radioMonthImport = document.querySelector("#month-import");
const radioQuarterImport = document.querySelector("#quarter-import");


function fetchDataAndUpdateImportChart(url){
    let isQuarter = url.includes('Quarter');
    let length = isQuarter ? 4 : 12;
    let labels = Array.from({length}, (_, i) => isQuarter ? `Quý ${i+1}` : `Tháng ${i+1}`);
    let year = url.slice(-4); // Lấy năm từ url

    fetch(url)
    .then(response => response.json())
    .then(data => {
        let importQuantity = Array(length).fill(0);

        if(isQuarter){
            data.forEach(item => {
                let index = parseInt(item.quarter) - 1; 
                importQuantity[index] = parseFloat(item.total_quantity); 
            });
            importConfig.options.plugins.title.text = `Biểu đồ tổng số lượng sản phẩm nhập vào qua các quý trong năm ${year}`;
        }else{
            data.forEach(item => {
                let index = parseInt(item.month) - 1; 
                importQuantity[index] = parseFloat(item.total_quantity); 
            });
            importConfig.options.plugins.title.text = `Biểu đồ tổng số lượng sản phẩm nhập vào qua các tháng trong năm ${year}`;
        }

        importConfig.data.labels = labels;
        importConfig.data.datasets[0].data = importQuantity;
        importChartEntity.update();
    })
    .catch(error => console.error('Error:', error));
}
yearSelectImport.addEventListener('change', (event) => {
    let year = event.target.value;
    let url = radioQuarterImport.checked ? `${urlQuarterImport}${year}` : `${urlMonthImport}${year}`;
    fetchDataAndUpdateImportChart(url);
});

radioMonthImport.addEventListener('change', () => {
    let year = yearSelectImport.value;
    let url = `${urlMonthImport}${year}`;
    fetchDataAndUpdateImportChart(url);
});

radioQuarterImport.addEventListener('change', () => {
    let year = yearSelectImport.value;
    let url = `${urlQuarterImport}${year}`;
    fetchDataAndUpdateImportChart(url);
});


var downloadImportChartJs = () => {
    html2canvas(document.getElementById("import")).then((canvas) => {
        var img = canvas.toDataURL(); //image data of canvas
        var doc = new jsPDF("l", "mm", "a4");

        doc.addImage(img, "PNG", 30, 10);
        doc.save("import_statistic.pdf");
    });
};
document.getElementById("download-import-chart").addEventListener("click", downloadExportChartJs);

// Buttons 
const exportChartElement = document.querySelector(".chart-container.export-chart");
const importChartElement = document.querySelector(".chart-container.import-chart");
const salaryChartElement = document.querySelector(".chart-container.salary-chart");
const profitChartElement = document.querySelector(".chart-container.profit-chart");
const businessSituationElement = document.querySelector(".chart-container.business-situation");
var buttons = document.querySelectorAll(".top-bar-buttons button");
var charts = document.querySelectorAll(".chart-container");
[...buttons].forEach((button) => {
    button.addEventListener("click", function(){
        [...charts].forEach((chart) => {
            chart.classList.add("hide");
        });
        if(button.className == "export-statistic"){
            if(exportChartEntity){
                exportChartEntity.destroy();
                exportChartEntity = new Chart(exportChart ,exportConfig);
            }
            exportChartElement.classList.remove("hide");
        }
        if(button.className == "import-statistic"){
            if(importChartEntity){
                importChartEntity.destroy();
                importChartEntity = new Chart(importChart ,importConfig);
            }
            importChartElement.classList.remove("hide");
        }
        if(button.className == "profit-statistic"){
            if(profitChartEntity){
                profitChartEntity.destroy();
                profitChartEntity = new Chart(profitChart ,profitConfig);
            }
            profitChartElement.classList.remove("hide");
        }
        if(button.className == "salary-statistic"){
            if(salaryChartEntity){
                salaryChartEntity.destroy();
                salaryChartEntity = new Chart(salaryChart ,salaryConfig);
            }
            salaryChartElement.classList.remove("hide");
        }
        if(button.className == "business-situation"){
            businessSituationElement.classList.remove("hide");
        }
        [...buttons].forEach((button) => {
            button.classList.remove("active");
        });
        this.classList.add("active");
    });
})
fetchDataAllProduct();
const optionProduct = document.querySelector("#option-product");
const optionCategory = document.querySelector("#category");
const startDate = document.querySelector("#start-date");
const endDate = document.querySelector("#end-date");
startDate.addEventListener("change", function(){
    startDate.max = endDate.value;
    endDate.min = startDate.value;
    if(optionProduct.value == "all-product" && startDate.value != "" && endDate.value != ""){
        fetchDataByTime(startDate.value, endDate.value);
    }else if(optionProduct.value == "category" && startDate.value != "" && endDate.value != ""){
        fetchDataByTimeByCategory(startDate.value, endDate.value, optionCategory.value);
    }
});
endDate.addEventListener("change", function(){
    startDate.max = endDate.value;
    endDate.min = startDate.value;
    if(optionProduct.value == "all-product" && startDate.value != "" && endDate.value != ""){
        fetchDataByTime(startDate.value, endDate.value);
    }else if(optionProduct.value == "category" && startDate.value != "" && endDate.value != ""){
        fetchDataByTimeByCategory(startDate.value, endDate.value, optionCategory.value);
    }
});
optionCategory.addEventListener("change", function(){
    if(optionProduct.value == "category" && startDate.value != "" && endDate.value != ""){
        fetchDataByTimeByCategory(startDate.value, endDate.value, optionCategory.value);
    }else{
        fetchDataByCategory(optionCategory.value);
    }
});
optionProduct.addEventListener("change", function(){
    if(optionProduct.value == "all-product"){
        optionCategory.classList.add("hide");
        if(startDate.value != "" && endDate.value != ""){
            fetchDataByTime(startDate.value, endDate.value);
        }else{
            fetchDataAllProduct();
        }  
        // optionCategory.selected = "Điện thoại";
    }else{
        optionCategory.classList.remove("hide");
        if(startDate.value != "" && endDate.value != ""){
            fetchDataByTimeByCategory(startDate.value, endDate.value, optionCategory.value);
        }else{
            fetchDataByCategory(optionCategory.value);
        }  
    }
});
const tbody = document.querySelector(".details table tbody");   
const numberOfProductValue = document.querySelector(".number-of-product-value");
const revenueValue = document.querySelector(".revenue-value");
const profitValue = document.querySelector(".profit-value");
const selectCategory = document.querySelector("#category");
fetch("../Category/GetAllCategoryName")
    .then((response) => response.json())
    .then((values) => {
        values.forEach((value) => {
            var option = document.createElement("option");
            option.textContent = value.category_name;
            option.value = value.category_name;
            selectCategory.appendChild(option);
        });
    })
    .catch((error) => console.log("Error: ", error));
function fetchDataAllProduct(){
    fetch("../InternalManager/GetAllDataBusinessSituation")
    .then((response) => response.json())
    .then((values) => {
        let totalProducts = 0;
        let totalRevenue = 0;
        let totalProfit = 0;
        tbody.innerHTML = '';
        values.revenueAllProduct.forEach((value) => {
                var row = tbody.insertRow();

                var orderDetailIdCell = row.insertCell();
                orderDetailIdCell.textContent = value.order_detail_id; // In ra order_id

                var productNameCell = row.insertCell();
                productNameCell.textContent = value.product_name; // In ra order_id

                var categoryCell = row.insertCell();
                categoryCell.textContent = value.category_name; // In ra order_id

                var importPriceCell = row.insertCell();
                importPriceCell.textContent = parseFloat(value.unit_price_import).toLocaleString('it-IT') + 'đ';// In ra order_id

                var priceCell = row.insertCell();
                priceCell.textContent = parseFloat(value.price).toLocaleString('it-IT') + 'đ'; // In ra order_id

                var quantityCell = row.insertCell();
                quantityCell.textContent = value.number_of_products; // In ra order_id
                totalProducts += parseInt(value.number_of_products);
                totalRevenue += parseFloat(value.price * value.number_of_products);
                
                var exportDateCell = row.insertCell();
                var date = new Date(value.export_date);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                if (day < 10) day = "0" + day;
                if (month < 10) month = "0" + month;
                var formattedDate = day + "/" + month + "/" + year;
                exportDateCell.textContent = formattedDate; // format lại ngày
        
                var profitCell = row.insertCell();
                profitCell.textContent = parseFloat(value.profit).toLocaleString('it-IT') + 'đ'; 
                totalProfit += parseFloat(value.profit);
        });
        numberOfProductValue.textContent = totalProducts;
        revenueValue.textContent = totalRevenue.toLocaleString('it-IT') + 'đ';
        profitValue.textContent = totalProfit.toLocaleString('it-IT') + 'đ';
    })
    .catch((error) => console.log("Error: ", error));
}
function fetchDataByCategory(category){
    fetch("../InternalManager/GetAllDataBusinessSituation")
    .then((response) => response.json())
    .then((values) => {
        let totalProducts = 0;
        let totalRevenue = 0;
        let totalProfit = 0;
        tbody.innerHTML = '';
        values.revenueAllProduct.forEach((value) => {
            if(value.category_name == category){
                var row = tbody.insertRow();

                var orderDetailIdCell = row.insertCell();
                orderDetailIdCell.textContent = value.order_detail_id; // In ra order_id

                var productNameCell = row.insertCell();
                productNameCell.textContent = value.product_name; // In ra order_id

                var categoryCell = row.insertCell();
                categoryCell.textContent = value.category_name; // In ra order_id

                var importPriceCell = row.insertCell();
                importPriceCell.textContent = parseFloat(value.unit_price_import).toLocaleString('it-IT') + 'đ';// In ra order_id

                var priceCell = row.insertCell();
                priceCell.textContent = parseFloat(value.price).toLocaleString('it-IT') + 'đ'; // In ra order_id

                var quantityCell = row.insertCell();
                quantityCell.textContent = value.number_of_products; // In ra order_id
                totalProducts += parseInt(value.number_of_products);
                totalRevenue += parseFloat(value.price * value.number_of_products);
                
                var exportDateCell = row.insertCell();
                var date = new Date(value.export_date);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                if (day < 10) day = "0" + day;
                if (month < 10) month = "0" + month;
                var formattedDate = day + "/" + month + "/" + year;
                exportDateCell.textContent = formattedDate; // format lại ngày
        
                var profitCell = row.insertCell();
                profitCell.textContent = parseFloat(value.profit).toLocaleString('it-IT') + 'đ'; 
                totalProfit += parseFloat(value.profit);
            }
        });
        numberOfProductValue.textContent = totalProducts;
        revenueValue.textContent = totalRevenue.toLocaleString('it-IT') + 'đ';
        profitValue.textContent = totalProfit.toLocaleString('it-IT') + 'đ';
    })
    .catch((error) => console.log("Error: ", error));
}
function fetchDataByTime(startDate, endDate){
    fetch("../Order/GetAllDataStatisticByTime/"+startDate+"/"+endDate)
    .then((response) => response.json())
    .then((values) => {
        let totalProducts = 0;
        let totalRevenue = 0;
        let totalProfit = 0;
        tbody.innerHTML = '';
        values.forEach((value) => {
                var row = tbody.insertRow();

                var orderDetailIdCell = row.insertCell();
                orderDetailIdCell.textContent = value.order_detail_id; // In ra order_id

                var productNameCell = row.insertCell();
                productNameCell.textContent = value.product_name; // In ra order_id

                var categoryCell = row.insertCell();
                categoryCell.textContent = value.category_name; // In ra order_id

                var importPriceCell = row.insertCell();
                importPriceCell.textContent = parseFloat(value.unit_price_import).toLocaleString('it-IT') + 'đ';// In ra order_id

                var priceCell = row.insertCell();
                priceCell.textContent = parseFloat(value.price).toLocaleString('it-IT') + 'đ'; // In ra order_id

                var quantityCell = row.insertCell();
                quantityCell.textContent = value.number_of_products; // In ra order_id
                totalProducts += parseInt(value.number_of_products);
                totalRevenue += parseFloat(value.price * value.number_of_products);
                
                var exportDateCell = row.insertCell();
                var date = new Date(value.export_date);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                if (day < 10) day = "0" + day;
                if (month < 10) month = "0" + month;
                var formattedDate = day + "/" + month + "/" + year;
                exportDateCell.textContent = formattedDate; // format lại ngày
        
                var profitCell = row.insertCell();
                profitCell.textContent = parseFloat(value.profit).toLocaleString('it-IT') + 'đ'; 
                totalProfit += parseFloat(value.profit);
        });
        numberOfProductValue.textContent = totalProducts;
        revenueValue.textContent = totalRevenue.toLocaleString('it-IT') + 'đ';
        profitValue.textContent = totalProfit.toLocaleString('it-IT') + 'đ';
    })
    .catch((error) => console.log("Error: ", error));
}
function fetchDataByTimeByCategory(startDate, endDate, category){
    fetch("../Order/GetAllDataStatisticByTime/"+startDate+"/"+endDate)
    .then((response) => response.json())
    .then((values) => {
        let totalProducts = 0;
        let totalRevenue = 0;
        let totalProfit = 0;
        tbody.innerHTML = '';
        values.forEach((value) => {
            if(value.category_name == category){
                var row = tbody.insertRow();

                var orderDetailIdCell = row.insertCell();
                orderDetailIdCell.textContent = value.order_detail_id; // In ra order_id

                var productNameCell = row.insertCell();
                productNameCell.textContent = value.product_name; // In ra order_id

                var categoryCell = row.insertCell();
                categoryCell.textContent = value.category_name; // In ra order_id

                var importPriceCell = row.insertCell();
                importPriceCell.textContent = parseFloat(value.unit_price_import).toLocaleString('it-IT') + 'đ';// In ra order_id

                var priceCell = row.insertCell();
                priceCell.textContent = parseFloat(value.price).toLocaleString('it-IT') + 'đ'; // In ra order_id

                var quantityCell = row.insertCell();
                quantityCell.textContent = value.number_of_products; // In ra order_id
                totalProducts += parseInt(value.number_of_products);
                totalRevenue += parseFloat(value.price * value.number_of_products);
                
                var exportDateCell = row.insertCell();
                var date = new Date(value.export_date);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                if (day < 10) day = "0" + day;
                if (month < 10) month = "0" + month;
                var formattedDate = day + "/" + month + "/" + year;
                exportDateCell.textContent = formattedDate; // format lại ngày
        
                var profitCell = row.insertCell();
                profitCell.textContent = parseFloat(value.profit).toLocaleString('it-IT') + 'đ'; 
                totalProfit += parseFloat(value.profit);
            }
                
        });
        numberOfProductValue.textContent = totalProducts;
        revenueValue.textContent = totalRevenue.toLocaleString('it-IT') + 'đ';
        profitValue.textContent = totalProfit.toLocaleString('it-IT') + 'đ';
    })
    .catch((error) => console.log("Error: ", error));
}