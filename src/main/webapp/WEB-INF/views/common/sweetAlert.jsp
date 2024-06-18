<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
        function showError(title, text, button) {
            swal({
                title : title,
                text : text,
                icon : 'error',
                button : button,
            })
        }
        
        function showWarning(title, text, button) {
            swal({
                title : title,
                text : text,
                icon : 'warning',
                button : button,
            })
        }

        function showSuccess(title, text, button) {
            swal({
                title : title,
                text : text,
                icon : 'success',
                button : button,
            })
        }
        
        function showSuccessThen(title, text, button) {
            swal({
                title : title,
                text : text,
                icon : 'success',
                button : button,
            }).then(function(result) {
                location.reload();
            })
        }

        function showConfirm(text, url) {
            swal({
                text : text,
                icon : 'warning',
                buttons : [ "취소", "이동" ],
                closeOnClickOutside : false,
            }).then(function(result) {
              

                if (result) {
                    location.href = url;
                }

            })
        }
        
        function showConfirmToTrue(text) {
            swal({
                text : text,
                icon : 'warning',
                buttons : [ "취소", "확인" ],
                closeOnClickOutside : false,
            }).then(function(result) {
             

                if (result) {
                    return true;
                } else {
                	return false;
                }

            })
        }
        
        function showConfirmToReport(text) {
            swal({
                text : text,
                icon : 'warning',
                buttons : [ "취소", "확인" ],
                closeOnClickOutside : false,
            }).then(function(result) {
               

                if (result) {
                    return true;
                } else {
                	return false;
                }

            })
        }
        
        function showHistoryBack(text) {
            swal({
                text : text,
                icon : 'warning',
                buttons : [ "취소", "확인" ],
                closeOnClickOutside : false,
            }).then(function(result) {
                console.log(result);

                if (result) {
                    window.history.back();
                }

            })
        }
    </script>
</body>
</html>