fetch("../InternalManager/GetAllDataImport")
    .then((response) => response.json())
    .then((values) => {

    })
    .catch((error) => console.log("Error: ", error));