function searchClassFunc() {
    var input = document.getElementById("searchClass").value.toLowerCase();
    var table = document.getElementById("classTable");
    var trs = table.getElementsByTagName("tr");
    for (var i = 1; i < trs.length; i++) {
        var show = false;
        var tds = trs[i].getElementsByTagName("td");
        for (var j = 0; j < tds.length; j++) {
            if (tds[j].innerText.toLowerCase().indexOf(input) > -1) show = true;
        }
        trs[i].style.display = show ? "" : "none";
    }
}
