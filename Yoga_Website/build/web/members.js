function zoomImage(img) {
    var modal = document.getElementById("zoomModal");
    var zoomImg = document.getElementById("zoomImg");
    zoomImg.src = img.src;
    modal.style.display = "flex";
}
function closeZoom() {
    document.getElementById("zoomModal").style.display = "none";
}
