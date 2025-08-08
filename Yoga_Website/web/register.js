function validateForm() {
    var name = document.forms["registerForm"]["fullname"].value;
    var email = document.forms["registerForm"]["email"].value;
    var phone = document.forms["registerForm"]["phone"].value;
    var emailPattern = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
    var phonePattern = /^\d{9,11}$/;
    if (name.trim() === "") { alert("Vui lòng nhập họ tên"); return false; }
    if (!emailPattern.test(email)) { alert("Email không hợp lệ"); return false; }
    if (!phonePattern.test(phone)) { alert("Số điện thoại không hợp lệ"); return false; }
    return true;
}
